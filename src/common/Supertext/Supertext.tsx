import React from 'react';
import { View, Text, StyleSheet } from 'react-native';
import { colors } from '../../styles';

type SupertextProps = {
  fontSize?: number;
  color?: string;
  children: any;
};

const Supertext = ({ fontSize = 16, color = colors.black, children }: SupertextProps) => {
  const styles = StyleSheet.create({
    textStyling: { fontSize: fontSize, color: color },
  });

  return <Text style={styles.textStyling}>{children}</Text>;
};

export default Supertext;
