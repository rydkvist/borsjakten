import React from 'react';
import { View, Text, Image, ScrollView, StyleSheet, StatusBar, TouchableOpacity } from 'react-native';
import { AchievementButton } from './components';

const HomeScreen = () => {
  return (
    <ScrollView>
      <View style={styles.sView}>
        <AchievementButton variant="closed" />
        <AchievementButton variant="active" />
        <AchievementButton variant="completed" />
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
  },
});

export default HomeScreen;
