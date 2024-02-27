import React, { FC, useState } from 'react';
import { EColor, ESize } from 'theme/theme.enum';
import Button from '../Button';
import Text from '../Text';
import { EFontWeight, ETextAlign, ETextType } from '../Text/Text.enum';
import styles from './CTA.module.scss';

const cloneCmd = 'https://github.com/TechieTeee/StarkByte';
const cloneLabel = 'https://github.com/TechieTeee/StarkByte';

const CTA: FC = () => {
  const [sensorData, setSensorData] = useState({
    userId: '',
    baseline: '',
    tolerance: '',
    readings: '',
  });

  const handleInputChange = (fieldName: string, value: string) => {
    setSensorData((prevData) => ({
      ...prevData,
      [fieldName]: value,
    }));
  };

  return (
    <div className={styles.container}>
      {/* Hero Image */}
      <img
        src="/assets/maximalfocus-VT4rx775FT4-unsplash.jpg"
        alt="Hero Image"
        className={styles.heroImage}
      />

      {/* Features Section */}
      <div className={styles.featuresSection}>
        <Text
          type={ETextType.h2}
          size={ESize.l}
          color={EColor.orangeGradient}
          weight={EFontWeight.bold}
          align={ETextAlign.center}
          style={{ marginBottom: '20px' }}
        >
          Features
        </Text>

        <ul className={styles.featuresList}>
          <li>Decentralized Network</li>
          <li>High Availability</li>
          <li>Increased Transparency</li>
          <li>Enhanced Insights</li>
          {/* Add more features as needed */}
        </ul>
      </div>

      {/* Introduce more space between paragraphs */}
      <div className={styles.spaceBetween}></div>

      {/* Title */}
      <Text
        type={ETextType.h2}
        size={ESize.l}
        color={EColor.orangeGradient}
        weight={EFontWeight.bold}
        align={ETextAlign.center}
        style={{ marginBottom: '20px' }}
      >
        Try It Out
      </Text>

      {/* Vertically stacked form */}
      <div className={styles.formContainer}>
        <form>
          <div className={styles.verticalForm}>
            <div className={styles.inputContainer}>
              <label htmlFor="userId">User ID:</label>
              <input
                type="text"
                id="userId"
                name="userId"
                value={sensorData.userId}
                onChange={(e) => handleInputChange('userId', e.target.value)}
                placeholder="Enter your User ID"
              />
            </div>

            <div className={styles.inputContainer}>
              <label htmlFor="baseline">Baseline:</label>
              <input
                type="text"
                id="baseline"
                name="baseline"
                value={sensorData.baseline}
                onChange={(e) => handleInputChange('baseline', e.target.value)}
                placeholder="Enter the Baseline"
              />
            </div>

            <div className={styles.inputContainer}>
              <label htmlFor="tolerance">Tolerance:</label>
              <input
                type="text"
                id="tolerance"
                name="tolerance"
                value={sensorData.tolerance}
                onChange={(e) => handleInputChange('tolerance', e.target.value)}
                placeholder="Enter the Tolerance"
              />
            </div>

            <div className={styles.inputContainer}>
              <label htmlFor="readings">Readings:</label>
              <input
                type="text"
                id="readings"
                name="readings"
                value={sensorData.readings}
                onChange={(e) => handleInputChange('readings', e.target.value)}
                placeholder="Enter the Readings"
              />
            </div>
          </div>

          {/* Add space between the inputs and the button */}
          <div className={styles.buttonContainer}>
            <Button color={EColor.lightOrange} valueToCopy={cloneCmd} noPaddingResponsive>
              {cloneLabel}
            </Button>
          </div>
        </form>
      </div>
    </div>
  );
};

export { CTA };
