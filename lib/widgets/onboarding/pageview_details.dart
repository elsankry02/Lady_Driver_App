// import 'package:flutter/material.dart';
// import 'package:lady_driver/models/onboarding_model.dart';
// import 'package:lady_driver/views/home_view.dart';

// class PageviewDetails extends StatefulWidget {
//   const PageviewDetails({super.key, required this.textTheme, required this.currentindex, required this.controller,}) ;
//  final TextTheme textTheme;
//  final int currentindex;
//  final PageController controller;
//   @override
//   State<PageviewDetails> createState() => _PageviewDetailsState();
// }

// class _PageviewDetailsState extends State<PageviewDetails> {
//   @override
//   Widget build(BuildContext context) {
//     return PageView.builder(
//       controller: widget.controller,
//       onPageChanged: (value) {
//         setState(() {
//               currentindex              = value;
//         });
//       },
//       itemCount: listOnBoarding.length,
//       itemBuilder: (context, index) => Column(
//         children: [
//           const SizedBox(height: 13),
//           //! Skip
//           GestureDetector(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) {
//                   return const HomeView();
//                 }),
//               );
//             },
//             child: Container(
//               margin: const EdgeInsets.only(left: 16),
//               width: double.infinity,
//               child: Text(
//                 textAlign: TextAlign.start,
//                 listOnBoarding[index].skip ?? '',
//                 style: widget.textTheme.titleMedium!.copyWith(
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(height: 74),
//           //! image
//           Image.asset(
//             height: 285,
//             width: 285,
//             listOnBoarding[index].image,
//           ),
//           const SizedBox(height: 96),
//           //! text
//           Text(
//             listOnBoarding[index].text,
//             style: widget.textTheme.headlineSmall!.copyWith(
//               fontWeight: FontWeight.w700,
//             ),
//           ),
//           const SizedBox(height: 24),
//           //! labalText
//           Text(
//             listOnBoarding[index].lableText,
//             style: widget.textTheme.titleSmall!.copyWith(
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }