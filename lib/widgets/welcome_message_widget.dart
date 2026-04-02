import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class WelcomeMessageWidget extends StatelessWidget {
  final String userName;
  final String welcomeMessage;
  final String? avatarImageUrl;
  final double avatarRadius;
  final double spacing;
  final double welcomeFontSize;
  final double nameFontSize;
  final Color? welcomeTextColor;
  final Color? nameTextColor;
  final FontWeight nameFontWeight;
  final Color? avatarBackgroundColor;
  final IconData avatarIcon;
  final double avatarIconSize;
  final Color? avatarIconColor;

  const WelcomeMessageWidget({
    super.key,
    required this.userName,
    this.welcomeMessage = 'Welcome Back,',
    //this.avatarImageUrl =        "https://nomorecopyright.com/_next/image?url=https%3A%2F%2Fres.cloudinary.com%2Fddtk9h9bc%2Fimage%2Fupload%2Fv1758886351%2Fvzxc6nry9zxebdru3g6i.webp&w=1200&q=75",
    this.avatarImageUrl =
        "https://alnisastore.com/wp-content/uploads/2025/11/photo.png",
    this.avatarRadius = 30,
    this.spacing = 16,
    this.welcomeFontSize = 16,
    this.nameFontSize = 22,
    this.welcomeTextColor,
    this.nameTextColor,
    this.nameFontWeight = FontWeight.bold,
    this.avatarBackgroundColor,
    this.avatarIcon = Icons.person,
    this.avatarIconSize = 35,
    this.avatarIconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: avatarRadius,

          backgroundImage: avatarImageUrl != null && avatarImageUrl!.isNotEmpty
              ? CachedNetworkImageProvider(avatarImageUrl!)
              : null,
          child: avatarImageUrl == null || avatarImageUrl!.isEmpty
              ? Icon(
                  avatarIcon,
                  size: avatarIconSize,
                  color: avatarIconColor ?? Colors.grey.shade600,
                )
              : null,
        ),
        SizedBox(width: spacing),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              welcomeMessage,
              style: TextStyle(
                fontSize: welcomeFontSize,
                color: welcomeTextColor ?? Colors.grey.shade700,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              userName,
              style: TextStyle(
                fontSize: nameFontSize,
                fontWeight: nameFontWeight,
                color: nameTextColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
