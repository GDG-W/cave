import 'package:cave/cave.dart';
import 'package:flutter/material.dart';

class MapFoot extends StatelessWidget {
  const MapFoot({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.string(
      _footSvg,
    );
  }
}

const _footSvg = '''
<?xml version="1.0" encoding="iso-8859-1"?>
<svg fill="#000000" height="800px" width="800px" version="1.1" id="Capa_1"
    xmlns="http://www.w3.org/2000/svg" viewBox="0 0 489.978 489.978" xml:space="preserve">
<g>
	<g>
		<g>
			<path d="M184.231,239.9c43.9,23.3,64.5,75.4,49.8,123.3c-2.7,8.6-5.1,17.5-7,26.4c-7.8,40,2.7,90.2,46.7,99.1
				c22.2,4.7,44.3-3.9,59.9-20.2c46.5-50.5,32.3-202.6,31.9-240.7c0-16.7-0.4-33.8-7-49.4c-14.8-35-56.4-49-93.3-58.7
				c-60.6-22.1-98.8,5.8-111.6,26.4S131.531,212.5,184.231,239.9z" />
            <ellipse cx="141.831" cy="44.3" rx="31.5" ry="44.3" />
            <ellipse cx="214.631" cy="51.7" rx="18.7" ry="26.4" />
            <ellipse cx="272.931" cy="68" rx="16.7" ry="23.3" />
            <ellipse cx="326.131" cy="81.7" rx="14.8" ry="20.6" />
            <ellipse transform="matrix(-0.2014 0.9795 -0.9795 -0.2014 546.9331 -227.4809)"
                cx="366.2" cy="109.218" rx="18.3" ry="13.2" />
		</g>
	</g>
</g>
</svg>
''';
