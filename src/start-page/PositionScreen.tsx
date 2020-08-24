import React from 'react';
import { View, Text, Image, ScrollView, StyleSheet, TouchableOpacity, ActivityIndicator, Platform } from 'react-native';

const PositionScreen = () => {
  return (
    <View style={styles.sView}>
      <Text style={styles.pageTitle}>Inställningar</Text>
    </View>
  );
};

const styles = StyleSheet.create({
  sView: {
    flex: 1,
    paddingTop: Platform.OS === 'ios' ? '20%' : '10%',
    paddingLeft: 40,
    paddingRight: 40,
  },
  pageTitle: {
    fontSize: 16,
    fontWeight: '700',
    marginBottom: 10,
  },
  buttonText: {
    fontSize: 14,
    fontWeight: '400',
  },
  buttonStyle: {
    backgroundColor: 'white',
    paddingTop: 14,
    paddingBottom: 14,
    paddingRight: 24,
    paddingLeft: 24,
    position: 'relative',
  },
  hrStyle: {
    position: 'absolute',
    bottom: 0,
    alignSelf: 'center',
    width: '100%',
    height: 0.5,
    backgroundColor: '#B6B6B6',
  },
  topRadius: {
    borderTopLeftRadius: 8,
    borderTopRightRadius: 8,
  },
  bottomRadius: {
    borderBottomLeftRadius: 8,
    borderBottomRightRadius: 8,
  },
});

export default PositionScreen;
