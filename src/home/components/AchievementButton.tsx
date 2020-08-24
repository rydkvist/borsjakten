import React from 'react';
import { View, Text, Image, ScrollView, StyleSheet, StatusBar, TouchableOpacity } from 'react-native';

import Icon from 'react-native-vector-icons/Octicons';

type AchievementButtonProps = {
  variant: 'active' | 'completed' | 'closed';
};

const AchievementButton = ({ variant }: AchievementButtonProps) => {
  const styles = StyleSheet.create({
    buttonStyle: {
      borderRadius: 50,
      width: 60,
      height: 60,
      backgroundColor: variant === 'closed' ? '#E6E6E6' : '#66BEFC',
    },
    activeStyle: {
      backgroundColor: 'white',
      borderRadius: 50,
      width: 48,
      height: 48,
    },
    centerAlign: {
      justifyContent: 'center',
      alignItems: 'center',
    },
  });

  return (
    <TouchableOpacity style={[styles.buttonStyle, styles.centerAlign]} onPress={() => {}}>
      {variant !== 'completed' && (
        <View style={[styles.activeStyle, styles.centerAlign]}>
          <Text>
            {variant === 'active' ? (
              <Icon name="play" size={24} color="#66BEFC" />
            ) : (
              <Icon name="lock" size={20} color="#000" />
            )}
          </Text>
        </View>
      )}
    </TouchableOpacity>
  );
};

export default AchievementButton;
