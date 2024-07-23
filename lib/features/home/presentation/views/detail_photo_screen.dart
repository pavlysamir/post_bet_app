import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_editor_plus/image_editor_plus.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:post_bet/constants.dart';
import 'package:post_bet/core/utils/dialog/loading_dialog.dart';
import 'package:post_bet/core/utils/dialog/success_dialog.dart';
import 'package:post_bet/core/utils/extension/string_extension.dart';
import 'package:post_bet/core/utils/snackbar/info_snackbar.dart';
import 'package:post_bet/features/home/data/models/photo/photo_model.dart';
import 'package:post_bet/features/home/presentation/manager/details_photo/details_photo_cubit.dart';
import 'package:post_bet/features/home/presentation/views/create_template_post.dart';

class DetailPhotoScreen extends StatelessWidget {
  const DetailPhotoScreen({super.key, required this.photo});
  final PhotoItemModel photo;

  @override
  Widget build(BuildContext context) {
    return DetailPhotoLayout(photo: photo);
  }
}

class DetailPhotoLayout extends StatefulWidget {
  const DetailPhotoLayout({super.key, required this.photo});
  final PhotoItemModel photo;

  @override
  State<DetailPhotoLayout> createState() => _DetailPhotoLayoutState();
}

class _DetailPhotoLayoutState extends State<DetailPhotoLayout> {
  dynamic _file;

  @override
  void initState() {
    super.initState();
    _file = widget.photo.src.portrait;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DetailsPhotosCubit, DetailsPhotosState>(
      listener: (context, state) {
        if (state is PhotoDownloading) {
          showLoadingDialog(context);
        } else if (state is PhotoDownloadedSuccess) {
          Navigator.pop(context);
          showSuccessDialog(context, "Success Download!");
        } else if (state is PhotoError) {
          Navigator.pop(context);
          showInfoSnackBar(
            context,
            "Something went wrong when downloading the photo, please try again!",
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              splashRadius: 20,
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Theme.of(context).textTheme.headlineLarge?.color,
              ),
            ),
            centerTitle: false,
            title: Text(
              "Detail Photo",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          body: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.66,
                child: _buildImage(),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: MediaQuery.of(context).padding.bottom,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.photo.photographer,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(height: 16),
                            if (widget.photo.alt != null &&
                                widget.photo.alt?.isNotEmpty == true) ...[
                              Text(
                                widget.photo.alt ?? "",
                                style: Theme.of(context).textTheme.bodyMedium,
                                maxLines: 2,
                              ),
                              const SizedBox(height: 16),
                            ],
                            Row(
                              children: [
                                Container(
                                  height: 24,
                                  width: 24,
                                  decoration: BoxDecoration(
                                    border: Border.all(),
                                    shape: BoxShape.circle,
                                    color: widget.photo.avgColor.toColor(),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  widget.photo.avgColor,
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                final imageBytes = await DetailsPhotosCubit.get(
                                        context)
                                    .urlToUint8List(widget.photo.src.original);

                                if (imageBytes != null) {
                                  final editedImage = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ImageEditor(
                                        image: imageBytes,
                                      ),
                                    ),
                                  );

                                  if (editedImage != null) {
                                    final editedFile =
                                        await _convertUint8ListToFile(
                                      editedImage,
                                    );
                                    setState(() {
                                      _file = editedFile;
                                      editedTempletePostImages = editedFile;
                                    });
                                  }
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: kPrimaryKey,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              child: Text(
                                "Edit Photo",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(color: Colors.white),
                              ),
                            ),
                            const SizedBox(height: 16),
                            OutlinedButton.icon(
                              onPressed: () {
                                if (_file is File) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          CreateTempletePostView(
                                        template: (_file as File),
                                      ),
                                    ),
                                  );
                                } else {
                                  showInfoSnackBar(
                                    context,
                                    "No edited image to share!",
                                  );
                                }
                              },
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.all(16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              icon: Icon(
                                CupertinoIcons.share,
                                color: Theme.of(context)
                                    .textTheme
                                    .headlineLarge
                                    ?.color,
                              ),
                              label: Text(
                                "Share",
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<File> _convertUint8ListToFile(Uint8List uint8List) async {
    final tempDir = await getTemporaryDirectory();
    final filePath = '${tempDir.path}/temp_image.jpg';
    final file = File(filePath);
    await file.writeAsBytes(uint8List);
    return file;
  }

  Widget _buildImage() {
    if (_file is Uint8List) {
      return Image.memory(_file as Uint8List, fit: BoxFit.cover);
    } else if (_file is File) {
      return Image.file(_file as File, fit: BoxFit.cover);
    } else if (_file is String) {
      return Image.network(_file as String, fit: BoxFit.cover);
    } else {
      return const Center(
        child: Icon(
          Icons.image_not_supported,
          color: Colors.blueGrey,
        ),
      );
    }
  }
}

Future<Uint8List?> urlToUint8List(String photoUrl) async {
  try {
    final response = await http.get(Uri.parse(photoUrl));
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      print('Failed to load image: ${response.statusCode}');
      return null;
    }
  } catch (e) {
    print('Error occurred while fetching image: $e');
    return null;
  }
}





                 //                     editedTempletePostImages = editedFile;
