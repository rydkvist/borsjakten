import React from 'react';
import { View, Text, Image, ScrollView, StyleSheet, StatusBar, TouchableOpacity } from 'react-native';
import { AchievementButton } from './components';

const HomeScreen = () => {
  return (
    <ScrollView>
      <View style={styles.sView}>
        <AchievementButton variant="closed" direction="up" />
        <AchievementButton variant="closed" direction="up" />
        <AchievementButton variant="closed" direction="up" />
        <AchievementButton variant="closed" direction="up" />
        <AchievementButton variant="closed" direction="up" />
        <AchievementButton variant="closed" direction="up" />
        <AchievementButton variant="closed" direction="up" />
        <AchievementButton variant="closed" direction="up" />
        <AchievementButton variant="active" direction="left" />
        <AchievementButton variant="completed" direction="up" />
      </View>
    </ScrollView>
  );
};

const styles = StyleSheet.create({
  sView: {
    flex: 1,
    marginTop: '50%',
    justifyContent: 'center',
    alignItems: 'center',
    marginBottom: '10%',
  },
});

export default HomeScreen;
