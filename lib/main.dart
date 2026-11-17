import 'package:material_ui/material_ui.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio — Philemon Bauma',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF7F7F2),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFB8F36B),
          surface: const Color(0xFFF7F7F2),
        ),
        fontFamily: 'Roboto',
      ),
      home: const PortfolioHome(),
    );
  }
}

class PortfolioHome extends StatefulWidget {
  const PortfolioHome({super.key});

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> {
  int _selectedPage = 0;
  String _selectedFilter = 'Tout';

  static const _filters = ['Tout', 'Identité', 'Digital', 'Affiche','Voir Plus'];
  static const _projects = [
    _Project(
      title: 'NOVA',
      category: 'Identité',
      description: 'Identité visuelle',
      imageUrl:
          'https://images.unsplash.com/photo-1558655146-d09347e92766?w=900&auto=format&fit=crop&q=85',
      color: Color(0xFFE9DCCB),
    ),
    _Project(
      title: 'MONO',
      category: 'Digital',
      description: 'Design d’application',
      imageUrl:
          'https://images.unsplash.com/photo-1559028006-448665bd7c7f?w=900&auto=format&fit=crop&q=85',
      color: Color(0xFFDCE6D5),
    ),
    _Project(
      title: 'SOLA',
      category: 'Affiche',
      description: 'Campagne & affiches',
      imageUrl:
          'https://images.unsplash.com/photo-1531058020387-3be344556be6?w=900&auto=format&fit=crop&q=85',
      color: Color(0xFFEAD9DE),
    ),
    _Project(
      title: 'ATELIER 08',
      category: 'Identité',
      description: 'Direction artistique',
      imageUrl:
          'https://images.unsplash.com/photo-1494438639946-1ebd1d20bf85?w=900&auto=format&fit=crop&q=85',
      color: Color(0xFFDCE2EA),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: _buildHeader()),
            if (_selectedPage == 2)
              SliverToBoxAdapter(child: _buildAbout())
            else ...[
              if (_selectedPage == 0)
                SliverToBoxAdapter(child: _buildIntro())
              else
                SliverToBoxAdapter(child: _buildProjectsIntro()),
              SliverToBoxAdapter(child: _buildFilters()),
              _buildProjectGrid(),
              SliverToBoxAdapter(child: _buildFooter()),
            ],
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedPage,
        onDestinationSelected: (index) {
          setState(() {
            _selectedPage = index;
            _selectedFilter = 'Tout';
          });
        },
        backgroundColor: const Color(0xFFF7F7F2),
        indicatorColor: const Color(0xFFB8F36B),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_rounded),
            label: 'Accueil',
          ),
          NavigationDestination(
            icon: Icon(Icons.grid_view_outlined),
            selectedIcon: Icon(Icons.grid_view_rounded),
            label: 'Projets',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline_rounded),
            selectedIcon: Icon(Icons.person_rounded),
            label: 'À propos',
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 12),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: const Color(0xFFB8F36B),
              borderRadius: BorderRadius.circular(14),
            ),
            alignment: Alignment.center,
            child: const Text(
              'PB',
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15),
            ),
          ),
          const SizedBox(width: 11),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'PHILEMON BAUMA',
                style: TextStyle(
                  fontSize: 12,
                  letterSpacing: 1.15,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 3),
              Text(
                'DESIGNER INDÉPENDANT',
                style: TextStyle(
                  fontSize: 9,
                  letterSpacing: 1.1,
                  color: Color(0xFF77776F),
                ),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            tooltip: 'Me contacter',
            onPressed: () => setState(() => _selectedPage = 2),
            style: IconButton.styleFrom(
              backgroundColor: Colors.white,
              minimumSize: const Size(42, 42),
            ),
            icon: const Icon(Icons.arrow_outward_rounded, size: 19),
          ),
        ],
      ),
    );
  }

  Widget _buildIntro() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
            decoration: BoxDecoration(
              color: const Color(0xFFE9F5D9),
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.circle, size: 8, color: Color(0xFF5C9B2B)),
                SizedBox(width: 7),
                Text(
                  'DISPONIBLE POUR DE NOUVEAUX PROJETS',
                  style: TextStyle(
                    fontSize: 9,
                    letterSpacing: .45,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Des idées fortes,\nune identité juste.',
            style: TextStyle(
              height: 1.05,
              fontSize: 37,
              letterSpacing: -1.6,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Je crée des expériences visuelles et digitales\nqui donnent vie aux marques.',
            style: TextStyle(
              height: 1.5,
              fontSize: 14,
              color: Color(0xFF74746D),
            ),
          ),
          const SizedBox(height: 19),
          Row(
            children: [
              const CircleAvatar(
                radius: 16,
                backgroundColor: Color(0xFFB8F36B),
                child: Icon(Icons.north_east_rounded, size: 17),
              ),
              const SizedBox(width: 9),
              Text(
                'Explorer mes projets',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey.shade800,
                ),
              ),
              const Spacer(),
              const Text(
                '01 / 04',
                style: TextStyle(
                  fontSize: 10,
                  letterSpacing: 1,
                  color: Color(0xFF85857C),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProjectsIntro() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(24, 25, 24, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'SÉLECTION',
            style: TextStyle(
              fontSize: 10,
              letterSpacing: 1.7,
              fontWeight: FontWeight.w700,
              color: Color(0xFF77776F),
            ),
          ),
          SizedBox(height: 7),
          Text(
            'Mes projets.',
            style: TextStyle(
              fontSize: 34,
              letterSpacing: -1.2,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilters() {
    return SizedBox(
      height: 46,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        scrollDirection: Axis.horizontal,
        itemCount: _filters.length,
        separatorBuilder: (_, _) => const SizedBox(width: 9),
        itemBuilder: (context, index) {
          final filter = _filters[index];
          final selected = filter == _selectedFilter;
          return ChoiceChip(
            label: Text(filter),
            selected: selected,
            onSelected: (_) => setState(() => _selectedFilter = filter),
            showCheckmark: false,
            labelStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: selected ? Colors.black : const Color(0xFF707069),
            ),
            backgroundColor: Colors.white,
            selectedColor: const Color(0xFFB8F36B),
            side: BorderSide.none,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProjectGrid() {
    final visibleProjects = _selectedFilter == 'Tout'
        ? _projects
        : _projects.where((project) => project.category == _selectedFilter);

    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 12),
      sliver: SliverLayoutBuilder(
        builder: (context, constraints) {
          final columns = constraints.crossAxisExtent > 600 ? 3 : 2;
          return SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              crossAxisSpacing: 12,
              mainAxisSpacing: 15,
              childAspectRatio: .70,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) => _ProjectCard(
                project: visibleProjects.elementAt(index),
              ),
              childCount: visibleProjects.length,
            ),
          );
        },
      ),
    );
  }

  Widget _buildAbout() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 34, 24, 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 170,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFFB8F36B),
              borderRadius: BorderRadius.circular(22),
            ),
            child: const Center(
              child: Text(
                'PB',
                style: TextStyle(
                  fontSize: 88,
                  letterSpacing: -8,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
          const SizedBox(height: 26),
          const Text(
            'Enchanté, moi c’est Philemon.',
            style: TextStyle(
              fontSize: 29,
              height: 1.1,
              letterSpacing: -1,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 14),
          const Text(
            'Designer indépendant, j’accompagne les marques dans la création '
            'de leur identité visuelle, de leurs supports imprimés et de leurs '
            'expériences digitales. Chaque projet commence par une bonne '
            'conversation et une idée qui mérite d’exister.',
            style: TextStyle(
              fontSize: 15,
              height: 1.65,
              color: Color(0xFF74746D),
            ),
          ),
          const SizedBox(height: 23),
          const Text(
            'Un projet en tête ?',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),
          const Text(
            'Discutons-en ensemble.',
            style: TextStyle(fontSize: 14, color: Color(0xFF74746D)),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(24, 4, 24, 26),
      child: Center(
        child: Text(
          'FAIT AVEC CURIOSITÉ · 2025',
          style: TextStyle(
            fontSize: 9,
            letterSpacing: 1.2,
            color: Color(0xFF85857C),
          ),
        ),
      ),
    );
  }
}

class _Project {
  const _Project({
    required this.title,
    required this.category,
    required this.description,
    required this.imageUrl,
    required this.color,
  });

  final String title;
  final String category;
  final String description;
  final String imageUrl;
  final Color color;
}

class _ProjectCard extends StatelessWidget {
  const _ProjectCard({required this.project});

  final _Project project;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: SizedBox(
              width: double.infinity,
              child: Image.network(
                project.imageUrl,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;
                  return _imagePlaceholder();
                },
                errorBuilder: (context, error, stackTrace) =>
                    _imagePlaceholder(),
              ),
            ),
          ),
        ),
        const SizedBox(height: 9),
        Row(
          children: [
            Expanded(
              child: Text(
                project.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12,
                  letterSpacing: .7,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const Icon(Icons.arrow_outward_rounded, size: 14),
          ],
        ),
        const SizedBox(height: 3),
        Text(
          project.description,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 10, color: Color(0xFF797971)),
        ),
      ],
    );
  }

  Widget _imagePlaceholder() {
    return ColoredBox(
      color: project.color,
      child: Center(
        child: Icon(
          Icons.image_outlined,
          size: 29,
          color: Colors.black.withValues(alpha: .35),
        ),
      ),
    );
  }
}
