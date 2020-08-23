import React from 'react';
import { View, Text, Image, ScrollView, StyleSheet, StatusBar } from 'react-native';
import { ObjectiveButton } from './components';

const HomeScreen = () => {
  return (
    <ScrollView>
      <View style={styles.sView}></View>
    </ScrollView>
  );
};

const styles = StyleSheet.create({
  sView: {
    flex: 1,
    justifyContent: 'flex-end',
    alignItems: 'center',
  },
});

export default HomeScreen;
