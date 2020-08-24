import React from 'react';
import { View, Text, Image, ScrollView, StyleSheet, StatusBar, TouchableOpacity } from 'react-native';
import Icon from 'react-native-vector-icons/Octicons';
import IonIcon from 'react-native-vector-icons/Ionicons';
import { colors } from '../../styles';

type AchievementButtonProps = {
  variant: 'active' | 'completed' | 'closed';
  direction: 'up' | 'right' | 'down' | 'left';
  onPress?: () => any;
};

const AchievementButton = ({ variant, direction, onPress = () => {} }: AchievementButtonProps) => {
  const isHorizontal = direction === ('right' || 'left');
  const isVertical = direction === ('up' || 'down');
  const isCompleted = variant === 'completed';
  const isClosed = variant === 'closed';

  const styles = StyleSheet.create({
    buttonStyle: {
      borderRadius: 50,
      width: 60,
      height: 60,
      backgroundColor: isClosed ? colors.sheepGrey : colors.lightAqua,
      zIndex: 100,
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
    pathView: {
      backgroundColor: isCompleted ? colors.lightAqua : colors.sheepGrey,
      width: 20,
      height: 34,
      marginBottom: isVertical ? -2 : 0,
      marginTop: isVertical ? -2 : 0,
      marginRight: isHorizontal ? -2 : 0,
      marginLeft: isHorizontal ? -2 : 0,
      zIndex: 0,
    },
  });

  return (
    <>
      <View style={styles.pathView} />
      <TouchableOpacity style={[styles.buttonStyle, styles.centerAlign]} onPress={onPress}>
        <View style={[isCompleted ? {} : styles.activeStyle, styles.centerAlign]}>
          {variant === 'completed' ? (
            <Icon name="check" size={28} color={colors.white} />
          ) : variant === 'active' ? (
            <Icon name="play" size={24} color={colors.aqua} />
          ) : (
            <IonIcon name="lock-closed" size={20} color={colors.grey} />
          )}
        </View>
      </TouchableOpacity>
    </>
  );
};

export default AchievementButton;
