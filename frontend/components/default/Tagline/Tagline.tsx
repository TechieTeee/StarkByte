import Text from '@components/default/Text';
import { EFontWeight, ETextAlign, ETextType } from '@components/default/Text/Text.enum';
import { FC } from 'react';
import { EColor, ESize } from 'theme/theme.enum';
import styles from './Tagline.module.scss';
import { ITagline } from './Tagline.type';

const Tagline: FC<ITagline> = () => {
	return (
		<div>
			<Text
				type={ETextType.h1}
				component={ETextType.h2}
				className={styles.text}
				weight={EFontWeight.regular}
				align={ETextAlign.center}
			>
				<Text type={ETextType.span} color={EColor.orangeGradient}>
					{`Starknet `}
				</Text>
				x
				<Text type={ETextType.span} color={EColor.orangeGradient}>
					{' NextJs '}
				</Text>
				x
				<Text type={ETextType.span} color={EColor.orangeGradient}>
					{' Argent'}
				</Text>
			</Text>

			<Text
				type={ETextType.h2}
				size={ESize.s}
				color={EColor.gray}
				weight={EFontWeight.regular}
				align={ETextAlign.center}
				style={{ marginBottom: '85px' }}
			>
				Building the Future of Decentralized Compute
			</Text>
		</div>
	);
};

export { Tagline };
