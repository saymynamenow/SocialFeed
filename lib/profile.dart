import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.indigo.shade600, Colors.indigo.shade300],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
              ),
              title: const Text('Profile'),
              centerTitle: true,
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Avatar
                        Container(
                          margin: const EdgeInsets.only(right: 12),
                          child: CircleAvatar(
                            radius: 44,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 40,
                              backgroundImage: null,
                              backgroundColor: Colors.blue.shade700,
                              child: const Text(
                                'AW',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),

                        // Name and actions
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 6),
                              const Text(
                                'Ayu Wijaya',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '@ayuw',
                                style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Expanded(
                                    child: OutlinedButton(
                                      onPressed: () {},
                                      child: const Text('Edit Profile'),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  OutlinedButton(
                                    onPressed: () {},
                                    child: const Icon(Icons.share),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),
                    // Bio
                    const Text(
                      'Penikmat budaya lokal • Pecinta makanan tradisional • Berbagi cerita perjalanan',
                      style: TextStyle(fontSize: 15),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 16,
                          color: Colors.grey.shade700,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'Yogyakarta, Indonesia',
                          style: TextStyle(color: Colors.grey.shade700),
                        ),
                        const SizedBox(width: 12),
                        Icon(Icons.link, size: 16, color: Colors.grey.shade700),
                        const SizedBox(width: 6),
                        Text(
                          'mariberbudaya.id',
                          style: TextStyle(color: Colors.blue.shade700),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Stats
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _statItem('Posts', '124'),
                        _statItem('Followers', '3.2K'),
                        _statItem('Following', '348'),
                      ],
                    ),

                    const SizedBox(height: 18),

                    const Divider(),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),

            // Tabs: Posts / Media / About (simple static implementation)
            SliverToBoxAdapter(
              child: DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    TabBar(
                      labelColor: Colors.indigo,
                      unselectedLabelColor: Colors.grey.shade600,
                      indicatorColor: Colors.indigo,
                      tabs: const [
                        Tab(text: 'Posts'),
                        Tab(text: 'Media'),
                        Tab(text: 'About'),
                      ],
                    ),
                    SizedBox(
                      height: 400,
                      child: TabBarView(
                        children: [
                          // Posts tab: simple list of static cards
                          ListView(
                            padding: const EdgeInsets.all(12),
                            shrinkWrap: true,
                            children: List.generate(
                              3,
                              (i) => _profilePostCard(i),
                            ),
                          ),
                          // Media tab: grid of simulated images
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: GridView.count(
                              crossAxisCount: 3,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8,
                              children: List.generate(
                                9,
                                (i) => Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.image,
                                      color: Colors.black26,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // About tab
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'About',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  'Ayu is a cultural enthusiast who loves to explore traditional markets and local recipes. She documents her travels and shares tips about preserving cultural heritage.',
                                ),
                                const SizedBox(height: 12),
                                const Text(
                                  'Interests',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(height: 6),
                                Wrap(
                                  spacing: 8,
                                  runSpacing: 6,
                                  children: const [
                                    Chip(label: Text('Food')),
                                    Chip(label: Text('Dance')),
                                    Chip(label: Text('Handicraft')),
                                    Chip(label: Text('Travel')),
                                  ],
                                ),
                              ],
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
      ),
    );
  }

  Widget _statItem(String label, String value) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
          ),
          const SizedBox(height: 4),
          Text(label, style: TextStyle(color: Colors.grey.shade700)),
        ],
      ),
    );
  }

  Widget _profilePostCard(int index) {
    final titles = [
      'Menjelajahi pasar tradisional',
      'Belajar membuat kue tradisional',
      'Pertunjukan tari daerah',
    ];
    final excerpts = [
      'Kemarin saya menemukan banyak barang antik dan kain tenun yang indah.',
      'Resep turun-temurun yang mudah diikuti untuk pemula.',
      'Suasana penonton sangat hangat dan penuh semangat.',
    ];

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titles[index],
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 6),
            Text(excerpts[index]),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.thumb_up, size: 16, color: Colors.grey.shade700),
                const SizedBox(width: 6),
                Text('12'),
                const SizedBox(width: 12),
                Icon(Icons.comment, size: 16, color: Colors.grey.shade700),
                const SizedBox(width: 6),
                Text('3'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
