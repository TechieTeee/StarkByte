import Image from 'next/image';
import { FC } from 'react';
import styles from './Technologies.module.scss';
import { ITechnologies } from './Technologies.type';

const LOGOS = [
  {
    label: 'Starknet',
    url: 'https://www.starknet.io/en',
    src: '/assets/logo-starknet-full.svg'
  },
  {
    label: 'NextJs',
    url: 'https://NextJs.org/',
    src: '/assets/logo-next.svg'
  },
  {
    label: 'Argent',
    url: 'https://www.argent.xyz/argent-x/',
    src: '/assets/Argent_X_Logo-removebg-preview.png'
  }
];

const Technologies: FC<ITechnologies> = () => {
  return (
    <div className={styles.technologies}>
      {/* Hero Image */}
      <div className={styles.heroImageContainer}>
        <Image src="/assets/Starkbyte_Logo.png" alt="Hero Image" layout="fill" objectFit="cover" />
      </div>

      {/* Technology Logos */}
      <div className={styles.logosSection}>
        {LOGOS.map((logo) => (
          <a
            className={`${styles.logoContainer} ${styles.withMargin}`}
            key={logo.label}
            href={logo.url}
            aria-label={`link to ${logo.label}`}
            target='_blank'
            rel='noopener noreferrer'
          >
            <Image src={logo.src} alt={logo.label} width={60} height={60} />
          </a>
        ))}
      </div>
    </div>
  );
};

export { Technologies };
