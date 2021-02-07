class Person{
  final personName;
  final personImage;
  Person({this.personName, this.personImage});
}

// class NewImage extends StatefulWidget {
//   @override
//   _NewImageState createState() => _NewImageState();
// }

// class _NewImageState extends State<NewImage> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
      
//     );
//   }
// }

//  Widget build(BuildContext context) {
//     return Provider<Example>(
//       create: (_) => Example(),
//       // Will throw a ProviderNotFoundError, because `context` is associated
//       // to the widget that is the parent of `Provider<Example>`
//       child: Text(context.watch<Example>()),
//     ),
//   }
//   Widget build(BuildContext context) {
//     return Provider<Example>(
//       create: (_) => Example(),
//       // we use `builder` to obtain a new `BuildContext` that has access to the provider
//       builder: (context) {
//         // No longer throws
//         return Text(context.watch<Example>()),
//       }
//     ),
//   }

