import React from 'react';
import { View, Text, Image, ScrollView, StyleSheet, TouchableOpacity, Alert, Platform } from 'react-native';

type WhiteButtonProps = {
  title: string;
  onPress: () => any;
  firstChild?: boolean;
  lastChild?: boolean;
};

const WhiteButton = ({ title, onPress, firstChild, lastChild }: WhiteButtonProps) => {
  return (
    <>
      <TouchableOpacity
        style={[styles.buttonStyle, firstChild ? styles.topRadius : lastChild ? styles.bottomRadius : {}]}
        onPress={onPress}
      >
        <Text style={styles.buttonText}>{title}</Text>
        {!lastChild && <View style={styles.hrStyle} />}
      </TouchableOpacity>
    </>
  );
};

const SettingsScreen = () => {
  return (
    <View style={styles.sView}>
      <Text style={styles.pageTitle}>Inställningar</Text>
      <View
        style={{
          shadowOpacity: 0.1,
          shadowRadius: 1,
          shadowOffset: { width: 0, height: 2 },
        }}
      >
        <WhiteButton title="Språk" onPress={() => {}} firstChild={true} />
        <WhiteButton title="Språk" onPress={() => {}} />
        <WhiteButton title="Språk" onPress={() => {}} lastChild={true} />
      </View>
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

export default SettingsScreen;
