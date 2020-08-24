import React from 'react';
import { View, Text, Image, ScrollView, StyleSheet, StatusBar, TouchableOpacity } from 'react-native';

const GamesScreen = () => {
  return (
    <ScrollView>
      <View style={styles.sView}>
        <Text>Games</Text>
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

export default GamesScreen;
