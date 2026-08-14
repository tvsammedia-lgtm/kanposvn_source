import 'package:flutter/foundation.dart';
import 'dart:async';
import '../../modules/kanposvnride/models/ride_booking.dart';

class RideSyncService {
  static const String baseUrl = 'https://kanride-api.vercel.app/api';

  /// Giáº£ láº­p viá»‡c gá»i HTTP POST lÃªn Vercel Ä‘á»ƒ Ä‘á»“ng bá»™ cÃ¡c cuá»‘c xe Ä‘ang offline
  static Future<bool> pushPendingBookings(List<RideBooking> bookings) async {
    if (bookings.isEmpty) return true;

    try {
      // Giáº£ láº­p Ä‘á»™ trá»… máº¡ng
      await Future.delayed(const Duration(milliseconds: 1000));
      
      // Log ra console Ä‘á»ƒ dá»… debug quÃ¡ trÃ¬nh sync ngáº§m
      debugPrint('SYNC ENGINE: ÄÃ£ Ä‘á»“ng bá»™ thÃ nh cÃ´ng ${bookings.length} cuá»‘c xe lÃªn Vercel.');
      
      return true;
    } catch (e) {
      debugPrint('SYNC ENGINE: Lá»—i Ä‘á»“ng bá»™ - $e');
      return false;
    }
  }
}

