import 'package:flutter/material.dart';

class SongPage extends StatelessWidget {
  const SongPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_downward),
          onPressed: () {
            
          },
        )
      ),
      body: Center(
        child: Text('Song Page'),
      ),
    );
  }
}
