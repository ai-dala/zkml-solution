mod xgb_inference;

fn main(input_vector: Span<i32>) -> i32 {
    let tree_0 = xgb_inference::Tree {
    base_weights: array![0, -630, 9453, 3903, -2081, 8622, 21902, 1851, 7736, -2670, 1616, 4711, 10182, 15407, 22741, -140, 3260, 2107, 9871, -3315, -592, 499, 3032, 1023, 6081, 8205, 11994, 1710, 16075, 23387, 4721, -1346, 770, 760, 4545, 408, 2915, 12321, 4859, -3794, -1659, -1149, 2174, 1255, -442, 1075, 3643, 138, 1826, 4952, 8558, 9108, 5863, 12996, 11151, 4362, 5288, 25509, 21963, -2855, -1038, -281, 1518, -10, 1192, 5931, 1869, 21, 3836, 2204, 4677, 11029, 20989, 4028, 9582, -3860, -2259, -1236, -2357, -2778, -692, 1470, 4415, -871, 2018, -206, -2183, 4, 3012, 2434, 4572, -891, 371, 777, 5453, 2446, 5562, 7286, 13202, 6487, 9699, 6363, 3872, 13654, 7676, 10210, 11848, 7004, 8056, 5820, 22540, -3240, -2506, -1996, -634, -1162, -59, 2402, 59, -1189, 281, -306, 1339, 4501, 7304, 1407, 2468, -458, 700, 3153, 4713, 1539, 3063, 3890, 6074, 9530, 12493, 18063, 25480, 3645, 5270, 8357, 11140, -4009, -3291, -1254, -3791, -2197, 97, -2079, -3426, -3661, -2089, -1363, -334, 563, 1871, 3113, 5280, -2078, -697, 1459, 3248, -872, 97, -1769, -3175, 986, -57, -376, 4514, 3067, 1327, 7019, 4013, -1139, -412, 184, 704, 1448, 629, 5879, -28, 1455, 3174, 3665, 6005, 2786, 8005, 949, 4002, 7943, 3099, 10513, 8749, 5813, 6975, 4008, 1203, 12797, 14652, 8538, 5362, 10394, 2869, 10026, 12198, 22306, 8315, -3123, -1168, -2119, -2795, -2710, -1547, -107, -1979, -2544, -997, -970, 78, 861, 3420, 457, -869, -1708, -714, 12, 884, -627, 1096, 1182, 2424, 5820, 2976, 7804, 4178, 1596, 585, 2142, 2665, -770, 444, 312, 1790, 2570, 4377, 4068, 1861, 1112, 2094, 2483, 3819, 3355, 4867, 5827, 7742, 10083, 7123, 13068, 9543, 19813, 14998, 26398, 20755, 3241, 4058, 5052, 6380, 7888, 2783, 10611, 3820, -3568, -4491, -3036, -4313, -4509, -1127, -3442, -3935, -2886, -1682, 977, -1349, -2544, -1865, -2985, -3975, -3930, -3362, -2207, -895, -1842, -781, -744, 439, 1609, 234, 1466, 2863, 4986, 2542, 4794, 6899, -2226, -1530, -973, -511, 756, 2784, 1821, 5270, -1161, -617, 157, -924, -2215, -1549, -3236, -708, -92, 1375, -1622, 225, 537, 4641, 2862, 4564, 966, 1889, 7232, 4550, 3418, 5743, -381, -885, -612, -38, -38, 287, 1053, 679, 334, 987, 1519, 2025, -153, 133, -62, 1629, 2810, 3626, 2459, 7395, 6295, 5230, 677, 3955, 7108, 9191, 6872, 8579, 867, 1045, 9701, 11408, 7843, 9399, 1642, 6063, 7279, 6340, 1072, 1285, 588, 151, 3358, 12892, 4303, 4633, 7893, 2830, 1638, 759, 10269, 3786, 8429, 11971, 11906, 13825, 22700, 6200, -1276, -3097, -1715, -870, -2619, -914, -3422, -2415, -2431, -1420, -872, 366, -2485, -1689, -780, -575, -1453, -536, -1191, -101, -54, 695, 1976, 679, 6473, 2855, 1001, 257, -1240, 617, -1818, -1031, -936, -50, -519, 196, 1171, 439, 36, -825, 636, 1248, 876, 1814, 1939, 2925, 7104, 4727, 1615, 3821, 5022, 8180, 9321, 3516, 1213, 1826, -528, 1634, 2246, 1728, 3375, 2582, -1096, -523, 182, 996, 40, 657, 1446, 2402, 1756, 2743, 1163, 1535, 775, 1243, 854, 1414, 2298, 1779, 1444, 2636, 4223, 3377, 2880, 3677, 4727, 7639, 5705, 2479, 1804, 8655, 8837, 10989, 3694, 8059, 13636, 10171, 7526, 12774, 14769, 20872, 14127, 5677, 7563, 8449, 5021, 21704, 2906, 3470, 4145, 1823, 5281, 3906, 6570, 4444, 7390, 8297, 10826, 8475, -4862, -3446, -4718, -3850, -3765, -2836, -3749, -4428, -1508, -991, -716, -2212, -3727, -3158, -4140, -3501, -3156, -2445, -2016, -1238, -255, 1876, -1709, -723, -2877, -2396, -2011, -1396, -3154, -2209, -1269, -3711, -3979, -990, -3759, -3149, -2846, -2053, -1378, -709, -746, -1975, 316, -1046, -882, 568, 284, 2033, 1330, 2669, -358, 685, 1060, 1841, 2659, 5250, 4131, 6205, 2071, 3699, 4578, 7283, 7387, 6200, -1473, -2285, -471, -328, -1540, -923, -621, -223, 394, 2289, 1513, 3258, 2832, 1330, 5647, 2950, -1387, -1037, -204, -665, -83, 526, -1025, -510, -812, -2072, -1624, -1159, -1022, -926, 1062, -127, -472, -1686, 135, 369, -305, 1266, 4688, -158, 3096, 1993, 179, 4612, 991, -848, 1943, -604, 8194, 6279, 1454, 1240, 2095, 4827, 5548, 8166, -281, -450, -339, -497, 38, -293, 246, -58, -13, 364, 540, 849, 77, 486, 731, 1234, -67, -16, 46, 9, -641, 494, 1267, 1963, 3056, 745, 1030, 1225, 2078, 3466, 9615, 4842, 5579, 6550, 3994, 6485, 566, 359, 3196, 1317, 1924, 7586, 6662, 9413, 4367, 7229, 2450, 2659, 9148, 10041, 10865, 3539, 7422, 8335, 3431, 9203, 1940, 1759, 2073, 2331, 1944, 1619, 3807, 3969, 2506, 1924, 1215, 10292, 2867, 7624, 3358, 13999, 12336, 10779, 16084, 3715, 6571, 7891, -917, -1026, -699, -373, -828, -649, -1112, -925, -903, -680, -881, -589, -476, -299, -618, -150, 472, -24, -831, -709, -525, -79, -544, -370, -216, 109, -520, -311, -76, 192, -83, 103, 314, 149, 1028, 151, 82, 318, 1778, 2142, 1118, 302, 173, 384, -23, 201, -415, -233, 93, 231, -588, -484, -343, -152, -336, -199, -81, 112, -113, -305, 9, 133, 268, 400, 51, 262, 52, -139, -280, -101, 3, 222, 332, 405, 188, 412, 511, 885, 522, 642, 797, 1006, 1450, 2237, 1293, 1578, 2289, 412, 2600, 678, 2626, 652, 2770, 1902, 1546, 2845, 957, 2244, 513, 309, 702, 510, -229, -59, 400, 583, 545, 715, 714, 329, 1131, 916, 804, 402, -402, -297, -192, -103, -28, 89, 274, 386, -28, 70, 164, 255, 368, 496, 690, 930, 232, 573, 711, 864, 270, 65, 465, 288, 565, 797, 392, 678, 310, 785, 734, 978, 1070, 1455, 852, 1352, 904, 553, 1056, 1249, 1321, 1731, 1160, 2389, 1637, 2075, 1906, 2742, 3004, 2238, 3410, 2712, 892, 1221, 3274, 2159, 3853, 4417, 2689, 3363, 1787, 2759, 4127, 2944, 5597, 2591, 6801, 5674, 3959, 4936, 4552, 6614, 712, 895, 838, 1062, 1049, 1275, 928, 432, 1507, 1729, 1719, 916, 2195, 1865, 995, 1926, 2260, 1680, 2746, 2405, 3079, 3389, 2676, 1551, -1413, -1518, -947, -1186, -1532, -1376, -1288, -1083, -1010, -1152, -736, -1011, -1156, -1061, -1285, -1359, -293, 170, 743, -683, -1052, -1205, -1044, -880, -1386, -1224, -1174, -916, -800, -990, -782, -653, -640, -281, 192, -399, -272, 182, 351, 924, -603, -432, -274, 129, -1042, -850, -752, -689, -575, -768, -460, -190, -972, -892, -725, -587, -1136, -1054, -1271, -1166, -983, -1165, -961, -743, -879, -799, -527, -707, -477, -370, -199, -396, -384, -136, -656, -526, 10, 172, -421, -256, -172, -428, 84, 315, 199, -130, 465, 740, 372, 527, 656, 934, -261, -79, 118, 271, 393, 133, 526, 1186, 912, 562, 1633, 1117, 1116, 1344, 1709, 2220, 365, 686, 959, 1476, 1537, 1024, 1837, 2329, 1772, 2320, 1774, 2827, -461, -266, -733, -596, -483, -356, -404, -257, -127, -230, -223, -51, -87, 289, 883, 377, 853, -243, 788, 1109, 709, 1197, 314, 647, 1434, 1790, 790, 973, -545, -391, -561, -306, -83, 40, -242, -180, -61, 28, 130, 292, -363, -273, -177, -84, -531, -634, -442, -541, -362, -237, -74, 148, -83, -168, -628, -415, -111, 45, 118, -84, -110, -38, 1316, 1619, 727, 1085, 298, 757, 1279, 1433, 276, 441, 495, 718, 2262, 2587, 1781, 2020, 444, 820, 2122, 1251, 1552, 1842, 2514, 1029, -155, 4, -168, -40, -36, 71, 75, -168, 27, -66, -67, 64, 184, 72, 176, 72, 786, 247, 115, 6, 201, 119, 238, 94, 362, 655, -345, -98, 54, 230, 430, 202, 425, 684, 702, 1103, 879, 410, 839, 1139, 2538, 3446, 1106, 2065, 1951, 1627, 408, 1969, 2391, 1135, 2944, 1646, 125, 191, 769, 1037, 2174, 2376, 2676, 880, 2632, 3238, 846, 1434, 2194, 1588, 2804, 2092, 3063, 2622, 2947, 3306, 2272, 2074, 2558, 2309, 2824, 2564, 1920, 3093, 2095, 2530, 4327, 2289, 4307, 3573, 3308, 2850, 4283, 5423].span(),
    left_children: array![1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31, 33, 35, 37, 39, 41, 43, 45, 47, 49, 51, 53, 0, 55, 57, 0, 59, 61, 63, 65, 67, 69, 71, 73, 75, 77, 79, 81, 83, 85, 87, 89, 91, 93, 95, 97, 99, 101, 103, 105, 0, 0, 107, 109, 111, 113, 115, 117, 119, 121, 123, 125, 127, 129, 131, 133, 135, 137, 139, 141, 143, 145, 147, 149, 151, 153, 155, 157, 159, 161, 163, 165, 167, 169, 171, 173, 175, 177, 179, 181, 183, 185, 187, 189, 191, 193, 195, 197, 199, 201, 203, 205, 0, 0, 0, 207, 209, 211, 213, 215, 217, 219, 221, 223, 225, 227, 229, 231, 233, 235, 237, 239, 241, 243, 245, 247, 249, 251, 253, 255, 257, 259, 261, 263, 265, 267, 269, 271, 273, 275, 277, 279, 281, 283, 285, 287, 289, 291, 293, 295, 297, 299, 301, 303, 305, 307, 309, 311, 313, 315, 317, 319, 0, 321, 323, 325, 327, 329, 331, 333, 335, 337, 339, 341, 0, 343, 345, 347, 349, 351, 353, 355, 357, 359, 0, 0, 361, 363, 365, 367, 369, 371, 373, 375, 377, 379, 381, 383, 385, 0, 387, 389, 391, 0, 393, 0, 395, 397, 399, 401, 403, 405, 407, 409, 411, 413, 415, 417, 419, 421, 423, 425, 427, 429, 431, 433, 435, 437, 439, 441, 443, 445, 447, 449, 451, 453, 455, 457, 459, 461, 463, 465, 467, 0, 469, 471, 473, 475, 477, 479, 481, 483, 485, 487, 489, 491, 493, 495, 497, 499, 501, 503, 505, 507, 509, 0, 511, 0, 513, 515, 517, 519, 521, 523, 525, 527, 529, 531, 533, 535, 537, 539, 541, 543, 545, 547, 549, 551, 553, 555, 557, 559, 561, 563, 565, 567, 569, 571, 573, 575, 577, 579, 581, 583, 585, 587, 589, 591, 593, 595, 597, 599, 601, 603, 605, 0, 607, 0, 609, 611, 613, 615, 617, 619, 621, 623, 625, 627, 629, 631, 0, 633, 635, 637, 639, 641, 0, 643, 645, 647, 0, 0, 649, 651, 653, 655, 657, 659, 661, 663, 665, 667, 669, 671, 673, 675, 677, 679, 0, 0, 681, 683, 685, 687, 0, 689, 691, 693, 0, 0, 0, 0, 0, 695, 0, 0, 697, 0, 0, 0, 699, 0, 701, 703, 705, 707, 709, 0, 0, 711, 713, 0, 715, 0, 717, 719, 721, 723, 725, 727, 729, 731, 0, 0, 733, 735, 737, 739, 741, 743, 745, 747, 749, 751, 753, 755, 757, 759, 761, 763, 765, 767, 769, 771, 773, 775, 777, 779, 781, 783, 785, 787, 789, 791, 793, 795, 797, 799, 801, 803, 805, 807, 809, 811, 813, 815, 817, 819, 821, 823, 825, 827, 829, 831, 833, 835, 837, 839, 841, 843, 0, 0, 0, 0, 845, 847, 849, 851, 853, 855, 857, 859, 861, 863, 865, 867, 869, 0, 0, 871, 873, 875, 877, 879, 881, 883, 885, 887, 889, 891, 893, 0, 0, 0, 0, 895, 897, 899, 901, 903, 905, 907, 909, 911, 913, 915, 917, 919, 921, 923, 925, 927, 929, 931, 933, 935, 0, 0, 937, 939, 941, 943, 945, 947, 949, 951, 953, 955, 957, 959, 961, 963, 965, 967, 969, 971, 973, 975, 0, 977, 979, 0, 981, 983, 985, 987, 989, 991, 993, 995, 997, 999, 1001, 1003, 1005, 1007, 1009, 1011, 1013, 1015, 1017, 1019, 1021, 1023, 1025, 1027, 1029, 1031, 1033, 1035, 1037, 1039, 1041, 1043, 0, 0, 1045, 1047, 1049, 1051, 1053, 1055, 1057, 1059, 1061, 1063, 1065, 1067, 1069, 1071, 1073, 1075, 1077, 1079, 1081, 1083, 0, 1085, 1087, 1089, 0, 0, 0, 1091, 1093, 1095, 1097, 1099, 1101, 0, 1103, 0, 1105, 1107, 0, 1109, 1111, 0, 1113, 0, 1115, 1117, 0, 0, 1119, 1121, 1123, 1125, 0, 1127, 0, 1129, 1131, 1133, 0, 1135, 1137, 1139, 1141, 1143, 1145, 1147, 1149, 1151, 0, 0, 0, 0, 1153, 1155, 1157, 1159, 1161, 0, 0, 0, 1163, 1165, 1167, 1169, 1171, 1173, 1175, 1177, 1179, 0, 1181, 0, 0, 1183, 1185, 1187, 1189, 1191, 0, 0, 1193, 1195, 1197, 0, 1199, 1201, 0, 1203, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1205, 0, 1207, 0, 1209, 1211, 1213, 1215, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0].span(),
    right_children: array![2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38, 40, 42, 44, 46, 48, 50, 52, 54, 0, 56, 58, 0, 60, 62, 64, 66, 68, 70, 72, 74, 76, 78, 80, 82, 84, 86, 88, 90, 92, 94, 96, 98, 100, 102, 104, 106, 0, 0, 108, 110, 112, 114, 116, 118, 120, 122, 124, 126, 128, 130, 132, 134, 136, 138, 140, 142, 144, 146, 148, 150, 152, 154, 156, 158, 160, 162, 164, 166, 168, 170, 172, 174, 176, 178, 180, 182, 184, 186, 188, 190, 192, 194, 196, 198, 200, 202, 204, 206, 0, 0, 0, 208, 210, 212, 214, 216, 218, 220, 222, 224, 226, 228, 230, 232, 234, 236, 238, 240, 242, 244, 246, 248, 250, 252, 254, 256, 258, 260, 262, 264, 266, 268, 270, 272, 274, 276, 278, 280, 282, 284, 286, 288, 290, 292, 294, 296, 298, 300, 302, 304, 306, 308, 310, 312, 314, 316, 318, 320, 0, 322, 324, 326, 328, 330, 332, 334, 336, 338, 340, 342, 0, 344, 346, 348, 350, 352, 354, 356, 358, 360, 0, 0, 362, 364, 366, 368, 370, 372, 374, 376, 378, 380, 382, 384, 386, 0, 388, 390, 392, 0, 394, 0, 396, 398, 400, 402, 404, 406, 408, 410, 412, 414, 416, 418, 420, 422, 424, 426, 428, 430, 432, 434, 436, 438, 440, 442, 444, 446, 448, 450, 452, 454, 456, 458, 460, 462, 464, 466, 468, 0, 470, 472, 474, 476, 478, 480, 482, 484, 486, 488, 490, 492, 494, 496, 498, 500, 502, 504, 506, 508, 510, 0, 512, 0, 514, 516, 518, 520, 522, 524, 526, 528, 530, 532, 534, 536, 538, 540, 542, 544, 546, 548, 550, 552, 554, 556, 558, 560, 562, 564, 566, 568, 570, 572, 574, 576, 578, 580, 582, 584, 586, 588, 590, 592, 594, 596, 598, 600, 602, 604, 606, 0, 608, 0, 610, 612, 614, 616, 618, 620, 622, 624, 626, 628, 630, 632, 0, 634, 636, 638, 640, 642, 0, 644, 646, 648, 0, 0, 650, 652, 654, 656, 658, 660, 662, 664, 666, 668, 670, 672, 674, 676, 678, 680, 0, 0, 682, 684, 686, 688, 0, 690, 692, 694, 0, 0, 0, 0, 0, 696, 0, 0, 698, 0, 0, 0, 700, 0, 702, 704, 706, 708, 710, 0, 0, 712, 714, 0, 716, 0, 718, 720, 722, 724, 726, 728, 730, 732, 0, 0, 734, 736, 738, 740, 742, 744, 746, 748, 750, 752, 754, 756, 758, 760, 762, 764, 766, 768, 770, 772, 774, 776, 778, 780, 782, 784, 786, 788, 790, 792, 794, 796, 798, 800, 802, 804, 806, 808, 810, 812, 814, 816, 818, 820, 822, 824, 826, 828, 830, 832, 834, 836, 838, 840, 842, 844, 0, 0, 0, 0, 846, 848, 850, 852, 854, 856, 858, 860, 862, 864, 866, 868, 870, 0, 0, 872, 874, 876, 878, 880, 882, 884, 886, 888, 890, 892, 894, 0, 0, 0, 0, 896, 898, 900, 902, 904, 906, 908, 910, 912, 914, 916, 918, 920, 922, 924, 926, 928, 930, 932, 934, 936, 0, 0, 938, 940, 942, 944, 946, 948, 950, 952, 954, 956, 958, 960, 962, 964, 966, 968, 970, 972, 974, 976, 0, 978, 980, 0, 982, 984, 986, 988, 990, 992, 994, 996, 998, 1000, 1002, 1004, 1006, 1008, 1010, 1012, 1014, 1016, 1018, 1020, 1022, 1024, 1026, 1028, 1030, 1032, 1034, 1036, 1038, 1040, 1042, 1044, 0, 0, 1046, 1048, 1050, 1052, 1054, 1056, 1058, 1060, 1062, 1064, 1066, 1068, 1070, 1072, 1074, 1076, 1078, 1080, 1082, 1084, 0, 1086, 1088, 1090, 0, 0, 0, 1092, 1094, 1096, 1098, 1100, 1102, 0, 1104, 0, 1106, 1108, 0, 1110, 1112, 0, 1114, 0, 1116, 1118, 0, 0, 1120, 1122, 1124, 1126, 0, 1128, 0, 1130, 1132, 1134, 0, 1136, 1138, 1140, 1142, 1144, 1146, 1148, 1150, 1152, 0, 0, 0, 0, 1154, 1156, 1158, 1160, 1162, 0, 0, 0, 1164, 1166, 1168, 1170, 1172, 1174, 1176, 1178, 1180, 0, 1182, 0, 0, 1184, 1186, 1188, 1190, 1192, 0, 0, 1194, 1196, 1198, 0, 1200, 1202, 0, 1204, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1206, 0, 1208, 0, 1210, 1212, 1214, 1216, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0].span(),
    split_indices: array![7, 1, 7, 6, 9, 1, 1, 6, 1, 4, 8, 9, 7, 0, 1, 6, 1, 1, 1, 9, 7, 1, 1, 1, 0, 1, 5, 0, 1, 5, 0, 6, 1, 1, 1, 8, 7, 8, 6, 2, 1, 7, 7, 1, 1, 0, 7, 1, 0, 1, 9, 1, 1, 1, 7, 0, 0, 5, 9, 6, 1, 1, 1, 1, 7, 6, 6, 1, 1, 1, 6, 7, 7, 6, 7, 9, 1, 1, 1, 7, 1, 1, 1, 1, 1, 7, 1, 7, 1, 1, 3, 6, 1, 1, 1, 8, 0, 1, 1, 1, 5, 7, 1, 7, 1, 1, 1, 0, 0, 0, 1, 1, 9, 9, 1, 1, 8, 1, 1, 1, 8, 1, 1, 0, 5, 1, 6, 7, 8, 7, 9, 7, 7, 1, 6, 9, 2, 1, 1, 7, 6, 6, 6, 1, 1, 8, 1, 1, 1, 6, 1, 7, 1, 7, 8, 1, 8, 1, 7, 1, 7, 0, 7, 7, 1, 7, 5, 0, 9, 1, 9, 0, 8, 1, 0, 5, 7, 6, 3, 0, 9, 5, 7, 1, 7, 9, 2, 1, 6, 0, 0, 7, 7, 7, 7, 7, 1, 7, 1, 6, 7, 7, 1, 1, 0, 0, 7, 1, 0, 1, 0, 1, 5, 1, 1, 1, 7, 7, 7, 1, 8, 9, 1, 1, 1, 7, 8, 7, 1, 1, 8, 7, 7, 1, 1, 1, 0, 6, 1, 8, 1, 7, 7, 8, 8, 7, 7, 0, 0, 8, 1, 7, 1, 8, 7, 7, 5, 7, 1, 1, 9, 1, 1, 7, 5, 7, 7, 9, 1, 6, 0, 9, 0, 2, 5, 1, 1, 9, 7, 1, 1, 9, 9, 1, 8, 6, 7, 7, 5, 1, 1, 1, 7, 1, 1, 1, 1, 8, 7, 7, 1, 8, 6, 1, 1, 1, 8, 6, 0, 9, 1, 1, 1, 8, 1, 7, 7, 7, 7, 5, 0, 3, 0, 1, 6, 5, 1, 0, 6, 1, 1, 5, 0, 1, 1, 0, 9, 1, 5, 1, 1, 0, 5, 9, 1, 0, 0, 7, 2, 6, 9, 1, 6, 9, 5, 8, 1, 7, 7, 6, 1, 0, 7, 0, 0, 7, 1, 7, 5, 0, 5, 6, 1, 0, 0, 0, 0, 0, 7, 0, 0, 1, 0, 0, 0, 6, 0, 1, 9, 1, 1, 1, 0, 0, 1, 6, 0, 1, 0, 5, 9, 5, 8, 6, 1, 6, 5, 0, 0, 9, 8, 7, 7, 1, 1, 1, 8, 7, 0, 7, 1, 8, 7, 7, 7, 8, 8, 0, 1, 8, 1, 0, 1, 7, 1, 1, 7, 7, 7, 1, 6, 1, 1, 1, 1, 6, 8, 1, 1, 7, 7, 1, 1, 5, 9, 7, 7, 7, 6, 8, 8, 8, 5, 5, 9, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 8, 1, 5, 1, 0, 0, 0, 5, 1, 8, 1, 7, 1, 6, 5, 1, 1, 8, 0, 0, 0, 0, 1, 1, 1, 1, 1, 7, 1, 1, 1, 1, 5, 7, 1, 7, 7, 9, 1, 1, 1, 5, 1, 0, 0, 9, 5, 1, 6, 8, 9, 1, 1, 0, 8, 5, 7, 7, 5, 5, 6, 1, 6, 7, 7, 0, 6, 1, 0, 1, 1, 0, 1, 9, 0, 8, 6, 7, 6, 1, 7, 1, 7, 7, 6, 5, 6, 1, 1, 1, 0, 7, 8, 6, 6, 1, 7, 1, 1, 5, 1, 0, 0, 1, 1, 1, 1, 1, 5, 1, 8, 7, 7, 8, 7, 7, 7, 8, 1, 7, 7, 7, 7, 0, 1, 1, 9, 0, 0, 0, 9, 0, 1, 7, 8, 5, 0, 1, 0, 7, 1, 0, 6, 7, 0, 8, 0, 7, 7, 0, 0, 1, 1, 6, 1, 0, 8, 0, 9, 8, 0, 0, 5, 8, 1, 1, 6, 1, 6, 0, 1, 0, 0, 0, 0, 1, 7, 1, 1, 1, 0, 0, 0, 7, 0, 7, 1, 5, 9, 1, 1, 5, 0, 6, 0, 0, 5, 1, 6, 0, 8, 0, 0, 5, 8, 6, 0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 6, 0, 1, 5, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0].span(),
    split_conditions: array![254798490, 74597, 459832760, 45440190, 251268600, 302833, 298974, 35708704, 50775, 1250000, 265686900, 372464500, 306474460, 4120469, 375905, 29332290, 51064, 26031, 67022, 166559910, 56118353, 435517, 291528, 281747, 4120469, 375905, 156701330, 1710, 282259, 225631710, 4721, 16197913, 50775, 34625, 67022, 142889440, 81018870, 118321180, 68231570, 19800000, 506462, 34471744, 75590100, 276926, 673059, 2578588, 223091820, 231374, 2919840, 276926, 567912060, 313605, 468434, 375905, 330359080, 4362, 5288, 192150150, 680424100, 14810603, 41439, 34625, 67022, 26031, 47092750, 40555603, 41407257, 22278, 22278, 34625, 66903890, 68002980, 112253710, 53336835, 102195850, 136689690, 200825, 291528, 673059, 24771066, 127200, 127200, 127200, 242723, 313605, 152043130, 793512, 219565360, 276926, 435517, 301000000, 235312960, 275503, 282259, 285872, 388514720, 2466769, 276926, 276926, 312511, 136237980, 276723560, 523283, 330359080, 468434, 368357, 313605, 7004, 8056, 5820, 369505, 71844, 35878160, 62158070, 67046, 22278, 50383554, 56186, 74094, 22278, 85224950, 49407, 50775, 442236, 30230502, 74094, 43237670, 85384260, 109963040, 137494780, 221886900, 71705250, 72910284, 34625, 80557324, 99494100, 19800000, 63530, 63530, 62303174, 61055240, 76297490, 89206680, 200825, 755022, 43384787, 214344, 242723, 391564, 74460535, 793512, 19086874, 165529, 46530370, 58398486, 79347, 82155050, 79347, 95949790, 231374, 212002440, 2091076, 190574790, 140184520, 624635, 173320170, 86819450, 986, 354763230, 242723, 308496830, 2038602, 298126000, 375905, 2091076, 175038600, 290622920, 204715760, 305000000, 1448, 354763230, 156701330, 276723560, 242723, 381040430, 492668460, 19800000, 242723, 235312960, 949, 4002, 276723560, 269955200, 283747970, 283747970, 264293750, 391564, 276723560, 703435, 192207180, 351797750, 330359080, 523283, 367622, 2869, 3299446, 381040430, 368357, 8315, 26031, -1168, 67022, 10421162, 26031, 26031, 56186, 24771066, 53520550, 47691580, 43069, 71103076, 65105505, 59494, 67046, 74550, 66072076, 86560016, 54527350, 30074, 38393, 56850000, 57313837, 52535290, 63530, 56186, 56186, 473426, 38091434, 74550, 72076764, 67046, 75590100, 96740686, 100029600, 121456590, 120116720, 157606770, 224331, 1861, 93229970, 30074, 61978190, 38393, 117315540, 96740686, 121751920, 49450270, 63509710, 60615, 63530, 130423830, 56186, 66533, 120116720, 54260420, 59141473, 71110913, 112631340, 74094, 72689490, 2783, 169851840, 3820, 5000000, 36075153, 243719, 793512, 49059323, 75590100, 208235, 241953, 201304590, 221886900, 313605, 167994860, 65540910, 121751920, 140184520, 53377625, 165529, 127200, 127200, 30151523, 79347, 79347, 165529, 165529, 83386960, 62303174, 58844403, 165529, 121456590, 68231570, 165529, 130081, 191572, 256373220, 156333470, 2214863, 298106600, 281747, 368357, 375905, 187451940, 468434, 173320170, 187124050, 149360120, 194040210, 71203640, -708, 301000000, 1375, 199328, 192207180, 136237980, 285872, 1403984, 143539260, 646786, 541501, 122034450, 1115296, 313605, 340936, -381, 344969210, 217241, 192150150, 266905, 242723, 1053, 136237980, 344969210, 291528, 1519, 2025, 269955200, 9500000, 259447730, 399374440, 266905, 330925270, 399374440, 166384270, 323399880, 291528, 330359080, 381040430, 219430960, 281747, 2091076, 290622920, 867, 1045, 264293750, 353641, 269955200, 147883070, 1642, 104920630, 174442990, 435517, 1072, 1285, 588, 151, 3358, 320111080, 4303, 4633, 435517, 2830, 1638, 759, 235312960, 3786, 312511, 567912060, 368357, 375905, 367622, 6200, -1276, 67046, 15531715, -870, 56186, -914, 15385400, 49059323, 11517131, 62275635, 20021754, 59494, 17543532, 19717584, -780, -575, 70269630, 76028265, 36834326, 44307953, 43069, 38393, 51787, 58398486, 44866090, 376367, 46817847, 70192, 66305360, 42182306, 61575134, 72309357, 80371790, 93229970, 479429, 32906, 87858484, 32906, 488492, 41439, 45705606, 50775, 43069, 68002980, 49655930, 55828470, 56186, 38514450, 51787, 59494, 51787, 63530, 43011157, 75086865, 67046, 67046, 55828470, 49380048, 70192, 67046, 25487505, 88845530, 70124570, 81018870, 88099520, 72689490, 95810596, 105450730, 115350100, 48210385, 40981055, 211905900, 1163, 1535, 775, 1243, 777051, 30074, 28747, 32906, 43069, 43069, 35111, 43069, 853855, 135323460, 43069, 27423578, 43069, 2479, 1804, 418254, 31488790, 63530, 82155050, 63530, 72910284, 66533, 63560333, 48210385, 51787, 59494, 136521880, 5677, 7563, 8449, 5021, 63793, 70192, 70192, 70192, 67272, 72309357, 67046, 67046, 74550, 74094, 50247790, 107446080, 71844, 19086874, 48558000, 65105505, 266432, 191572, 624635, 47769638, 831270, -1508, -991, 98773315, 32077774, 206088, 72689490, 101043585, 141282310, 199973, 231374, 1950099, 193675650, 75874910, 146487670, 111203270, 71203640, 25357953, 70841473, 610307, 106015760, 120116720, 160281300, -1269, 103708010, 127200, -990, 79347, 165529, 287004, 147764, 44961447, 229415, 55331640, 30500427, 50448030, 37288028, 147764, 41084150, 147764, 49095395, 60822363, 49211646, 27571585, 50864520, 147764, 165529, 147764, 479429, 81891480, 132893520, 60501074, 79248096, 147764, 81018870, 127598, 155561, 132689170, 217241, -471, -328, 275503, 243719, 266905, 250465, 291528, 96542760, 279672, 238098490, 170591200, 173320170, 238098490, 200505620, 125219650, 117285220, 238098490, 480055, 165413870, 190574790, 175980870, 197138900, -812, 703435, 720061, 308496830, -1022, -926, 1062, 329498580, 2919840, 217241, 226953270, 307619380, 125819430, 1266, 282259, -158, 204375090, 302833, 179, 164246190, 204375090, -848, 317783280, -604, 238223320, 241708860, 1454, 1240, 302833, 375905, 182891590, 375905, -281, 317783280, -339, 354763230, 329616770, 3710121, 246, 130037260, 323399880, 266905, 276926, 192207180, 283516, 192207180, 2373619, 298974, -67, -16, 46, 9, 217241, 330359080, 274527, 243719, 250465, 745, 1030, 1225, 269955200, 1950099, 351797750, 291528, 130037260, 379045800, 279672, 297944, 200550200, 359, 281107450, 1317, 1924, 175038600, 279672, 259447730, 1731956, 357577470, 2450, 2659, 130037260, 350350150, 174442990, 3539, 367622, 368357, 3431, 368357, 1940, 1759, 2073, 2331, 1944, 1619, 3807, 3969, 2506, 1924, 1215, 309771, 2867, 296163700, 3358, 312511, 183490150, 375905, 476272750, 3715, 6571, 7891, -917, -1026, -699, -373, -828, -649, -1112, -925, -903, -680, -881, -589, -476, -299, -618, -150, 472, -24, -831, -709, -525, -79, -544, -370, -216, 109, -520, -311, -76, 192, -83, 103, 314, 149, 1028, 151, 82, 318, 1778, 2142, 1118, 302, 173, 384, -23, 201, -415, -233, 93, 231, -588, -484, -343, -152, -336, -199, -81, 112, -113, -305, 9, 133, 268, 400, 51, 262, 52, -139, -280, -101, 3, 222, 332, 405, 188, 412, 511, 885, 522, 642, 797, 1006, 1450, 2237, 1293, 1578, 2289, 412, 2600, 678, 2626, 652, 2770, 1902, 1546, 2845, 957, 2244, 513, 309, 702, 510, -229, -59, 400, 583, 545, 715, 714, 329, 1131, 916, 804, 402, -402, -297, -192, -103, -28, 89, 274, 386, -28, 70, 164, 255, 368, 496, 690, 930, 232, 573, 711, 864, 270, 65, 465, 288, 565, 797, 392, 678, 310, 785, 734, 978, 1070, 1455, 852, 1352, 904, 553, 1056, 1249, 1321, 1731, 1160, 2389, 1637, 2075, 1906, 2742, 3004, 2238, 3410, 2712, 892, 1221, 3274, 2159, 3853, 4417, 2689, 3363, 1787, 2759, 4127, 2944, 5597, 2591, 6801, 5674, 3959, 4936, 4552, 6614, 712, 895, 838, 1062, 1049, 1275, 928, 432, 1507, 1729, 1719, 916, 2195, 1865, 995, 1926, 2260, 1680, 2746, 2405, 3079, 3389, 2676, 1551, -1413, -1518, -947, -1186, -1532, -1376, -1288, -1083, -1010, -1152, -736, -1011, -1156, -1061, -1285, -1359, -293, 170, 743, -683, -1052, -1205, -1044, -880, -1386, -1224, -1174, -916, -800, -990, -782, -653, -640, -281, 192, -399, -272, 182, 351, 924, -603, -432, -274, 129, -1042, -850, -752, -689, -575, -768, -460, -190, -972, -892, -725, -587, -1136, -1054, -1271, -1166, -983, -1165, -961, -743, -879, -799, -527, -707, -477, -370, -199, -396, -384, -136, -656, -526, 10, 172, -421, -256, -172, -428, 84, 315, 199, -130, 465, 740, 372, 527, 656, 934, -261, -79, 118, 271, 393, 133, 526, 1186, 912, 562, 1633, 1117, 1116, 1344, 1709, 2220, 365, 686, 959, 1476, 1537, 1024, 1837, 2329, 1772, 2320, 1774, 2827, -461, -266, -733, -596, -483, -356, -404, -257, -127, -230, -223, -51, -87, 289, 883, 377, 853, -243, 788, 1109, 709, 1197, 314, 647, 1434, 1790, 790, 973, -545, -391, -561, -306, -83, 40, -242, -180, -61, 28, 130, 292, -363, -273, -177, -84, -531, -634, -442, -541, -362, -237, -74, 148, -83, -168, -628, -415, -111, 45, 118, -84, -110, -38, 1316, 1619, 727, 1085, 298, 757, 1279, 1433, 276, 441, 495, 718, 2262, 2587, 1781, 2020, 444, 820, 2122, 1251, 1552, 1842, 2514, 1029, -155, 4, -168, -40, -36, 71, 75, -168, 27, -66, -67, 64, 184, 72, 176, 72, 786, 247, 115, 6, 201, 119, 238, 94, 362, 655, -345, -98, 54, 230, 430, 202, 425, 684, 702, 1103, 879, 410, 839, 1139, 2538, 3446, 1106, 2065, 1951, 1627, 408, 1969, 2391, 1135, 2944, 1646, 125, 191, 769, 1037, 2174, 2376, 2676, 880, 2632, 3238, 846, 1434, 2194, 1588, 2804, 2092, 3063, 2622, 2947, 3306, 2272, 2074, 2558, 2309, 2824, 2564, 1920, 3093, 2095, 2530, 4327, 2289, 4307, 3573, 3308, 2850, 4283, 5423].span()
};
    let num_trees: u32 = 1;
    let base_score: i32 = 5919;
    let opt_type: u8 = 0;
    let trees: Span<xgb_inference::Tree> = array![tree_0].span();
    let mut result: i32 = xgb_inference::accumulate_scores_from_trees(num_trees, trees, input_vector, 0, 0);

    if opt_type == 1 {
        // Implement logic here
    } else {
        result = result + base_score;
    }

    return result;
}