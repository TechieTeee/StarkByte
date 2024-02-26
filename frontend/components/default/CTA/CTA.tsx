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
          {`Why IoT, Blockchain, and Edge Computing are a powerful combo:`}
          {` Add your description here...`}
        </p>
        <p>{/* Add space between the description and the inputs */}</p>
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

          <p>{/* Add space between the inputs and the button */}</p>

          <Button color={EColor.lightOrange} valueToCopy={cloneCmd} noPaddingResponsive>
            {cloneLabel}
          </Button>
        </form>
      </Text>
    </div>
  );
};

export { CTA };