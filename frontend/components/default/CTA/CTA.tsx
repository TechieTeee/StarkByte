import { FC } from 'react';
import { EColor, ESize } from 'theme/theme.enum';
import Button from '../Button';
import Text from '../Text';
import { EFontWeight, ETextAlign, ETextType } from '../Text/Text.enum';
import styles from './CTA.module.scss';

const cloneCmd = 'https://github.com/TechieTeee/StarkByte';
const cloneLabel = 'https://github.com/TechieTeee/StarkByte';

const CTA: FC = () => {
	return (
		<div className={styles.container}>
			<Text
				type={ETextType.h2}
				size={ESize.s}
				color={EColor.gray}
				weight={EFontWeight.regular}
				align={ETextAlign.center}
				className={styles.text}
			>
				<Button color={EColor.lightOrange} valueToCopy={cloneCmd} noPaddingResponsive>
					{cloneLabel}
				</Button>
			</Text>
		</div>
	);
};

export { CTA };
