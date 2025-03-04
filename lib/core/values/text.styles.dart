import 'package:flutter/material.dart';
import 'package:open_library/app/services/navigation.service.dart';

final TextStyle titleLarge = Theme.of(NavigationService.context).textTheme.titleLarge!;
final TextStyle titleMedium = Theme.of(NavigationService.context).textTheme.titleMedium!;
final TextStyle titleSmall = Theme.of(NavigationService.context).textTheme.titleSmall!;

final TextStyle bodyLarge = Theme.of(NavigationService.context).textTheme.bodyLarge!;
///[bodyMedium] has configured whit color default disabledColor
final TextStyle bodyMedium =Theme.of(NavigationService.context).textTheme.bodyMedium!.apply(color: Theme.of(NavigationService.context).disabledColor);
final TextStyle bodySmall = Theme.of(NavigationService.context).textTheme.bodySmall!;

final TextStyle headlineLarge = Theme.of(NavigationService.context).textTheme.headlineLarge!;
final TextStyle labelLarge = Theme.of(NavigationService.context).textTheme.labelLarge!;
