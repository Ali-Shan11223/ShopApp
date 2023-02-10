import 'package:flutter/material.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/edit-product';
  const EditProductScreen({super.key});

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _imageUrlFocusNode = FocusNode();

  @override
  void initState() {
    _imageUrlFocusNode.addListener(updateImageUrl);
    super.initState();
  }

  // For disposing focusNodes and controllers to release memory
  @override
  void dispose() {
    _imageUrlFocusNode.removeListener(updateImageUrl);
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageUrlController.dispose();
    _imageUrlFocusNode.dispose();
    super.dispose();
  }

  void updateImageUrl() {
    if (!_imageUrlFocusNode.hasFocus) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
            child: ListView(
          children: [
            TextFormField(
              textCapitalization: TextCapitalization.sentences,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(labelText: 'Title'),
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_priceFocusNode);
              },
              autocorrect: true,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Price'),
              focusNode: _priceFocusNode,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_descriptionFocusNode);
              },
            ),
            TextFormField(
              keyboardType: TextInputType.multiline,
              textCapitalization: TextCapitalization.sentences,
              decoration: const InputDecoration(labelText: 'Description'),
              maxLines: 3,
              focusNode: _descriptionFocusNode,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10, right: 10),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey)),
                  child: _imageUrlController.text.isEmpty
                      ? const Center(child: Text('Enter a URL'))
                      : FittedBox(
                          child: Image.network(
                            _imageUrlController.text,
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
                Expanded(
                    child: TextFormField(
                  controller: _imageUrlController,
                  keyboardType: TextInputType.url,
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(labelText: 'Image URL'),
                  focusNode: _imageUrlFocusNode,
                ))
              ],
            )
          ],
        )),
      ),
    );
  }
}
