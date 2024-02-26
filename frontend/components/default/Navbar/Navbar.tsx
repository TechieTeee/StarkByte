import Button from '@components/default/Button';
import Text from '@components/default/Text';
import { ETextType } from '@components/default/Text/Text.enum';
import { FaStar } from 'react-icons/fa';
import { EColor, ESize } from 'theme/theme.enum';
import WalletButton from '../WalletButton';
import styles from './Navbar.module.scss';

const repoUrl = 'https://github.com/swiiny/starknext';

const Navbar = () => {
	return (
		<nav className={styles.navbar}>
			<Text type={ETextType.h1} size={ESize.s}>
				StarkByte
			</Text>

			<div>

				<WalletButton />
			</div>
		</nav>
	);
};

export { Navbar };
