import 'package:pro_web_toon/models/webtoon_model.dart';

final data = <WebtoonModel>[
  WebtoonModel(
    id: 1,
    title: 'The Beginning After The End',
    genre: 'Adventure',
    description:
        """King Grey has unrivaled strength, wealth, and prestige in a world governed through martial ability. However, solitude lingers closely behind those with great power. Beneath the glamorous exterior of a powerful king lurks the shell of a man, devoid of purpose and will. Reincarnated into a new world filled with magic and monsters, the king has a second chance to relive his life. Correcting the mistakes of his past will not be his only challenge, however. Underneath the peace and prosperity of the new world is an undercurrent threatening to destroy everything he has worked for, questioning his role and reason for being born again.""",
    cover: 'assets/afterendcover.jpg',
    creator: 'TurtleMe',
    viewsCount: 1000000,
    createdAt: DateTime(2017, 01, 18),
    updatedAt: DateTime(2024, 07, 11),
    updateDay: 4,
    status: 'Ongoing',
  ),

  // Add Noblesse webtoon data
  WebtoonModel(
    id: 2,
    title: 'Noblesse',
    genre: 'Action',
    description:
        """Rai, an exceptional and dignified man of breathtaking beauty, awakens from a white coffin in a deserted building in South Korea. Since he is unaware of the present era, Rai must rely on his loyal and trusted companion, Frankenstein, who serves as the principal of Ye Ran High School close by. Rai transforms his medieval wardrobe into the sleek blazer of a modern-day student to blend in with society.
Having been dormant for the past 820 years, Frankenstein helps Rai comprehend and adjust to modern society by enrolling him in Ye Ran High School. But Frankenstein’s plans to grant Rai a normal life fall short as the unresolved conflicts from their turbulent past resurface. Alongside the hurdles of contemporary life, Rai must depend on his enigmatic abilities to protect his loved ones in this predicament.""",
    cover: 'assets/noblessecover.jpg',
    creator: 'Son Jeho',
    viewsCount: 1000000,
    createdAt: DateTime(2011, 09, 28),
    updatedAt: DateTime(2017, 02, 10),
    updateDay: 2,
    status: 'Completed',
  ),
];
