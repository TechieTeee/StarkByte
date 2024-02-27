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
      <Text
        type={ETextType.h2}
        size={ESize.s}
        color={EColor.gray}
        weight={EFontWeight.regular}
        align={ETextAlign.center}
        className={styles.text}
      >
        <p>
          {`Background`}
        </p>
        <p>
          {`In the burgeoning landscape of cloud computing and big data, StarkByte, poised to thrive in the anticipated $349.56 billion industry of 2024, strategically integrates edge computing, IoT, and the revolutionary blockchain technology StarkNet. This fusion presents a transformative synergy, offering unparalleled advantages such as real-time processing through edge computing, comprehensive data collection via IoT, and heightened security and transparency facilitated by blockchain. StarkByte's innovative approach not only optimizes resource allocation, minimizes latency, and ensures data integrity but also establishes a foundation for scalable, decentralized solutions, making it a formidable player in shaping the future of cloud-based technologies.`}
        </p>

        {/* Add more space between the description and the inputs */}
        <div className={styles.formContainer}>
          <form>
            <label htmlFor="userId">User ID:</label>
            <input
              type="text"
              id="userId"
              name="userId"
              value={sensorData.userId}
              onChange={(e) => handleInputChange('userId', e.target.value)}
            />

            <label htmlFor="baseline">Baseline:</label>
            <input
              type="text"
              id="baseline"
              name="baseline"
              value={sensorData.baseline}
              onChange={(e) => handleInputChange('baseline', e.target.value)}
            />

            <label htmlFor="tolerance">Tolerance:</label>
            <input
              type="text"
              id="tolerance"
              name="tolerance"
              value={sensorData.tolerance}
              onChange={(e) => handleInputChange('tolerance', e.target.value)}
            />

            <label htmlFor="readings">Readings:</label>
            <input
              type="text"
              id="readings"
              name="readings"
              value={sensorData.readings}
              onChange={(e) => handleInputChange('readings', e.target.value)}
            />

            {/* Add space between the inputs and the button */}
            <div className={styles.buttonContainer}>
              <Button color={EColor.lightOrange} valueToCopy={cloneCmd} noPaddingResponsive>
                {cloneLabel}
              </Button>
            </div>
          </form>
        </div>
      </Text>
    </div>
  );
};

export { CTA };
