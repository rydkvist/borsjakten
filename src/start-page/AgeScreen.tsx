import React, { useState } from 'react';
import {
  View,
  Text,
  Image,
  ScrollView,
  StyleSheet,
  ActivityIndicator,
  Platform,
  TouchableOpacity,
  TouchableOpacityBase,
  Button,
} from 'react-native';
import { colors } from '../styles';

export enum UserAge {
  EMPTY = 'EMPTY',
  LESS_THEN_15 = 'LESS_THEN_15',
  BETWEEN_16_AND_19 = 'BETWEEN_16_AND_19',
  BETWEEN_20_AND_25 = 'BETWEEN_20_AND_25',
  OLDER_THEN_25 = 'OLDER_THEN_25',
}

const AgeScreen = () => {
  const [userAge, setUserAge] = useState(UserAge.EMPTY);

  return (
    <View style={styles.sView}>
      <Text style={styles.pageTitle}>Ålder</Text>
      <TouchableOpacity style={styles.buttonStyle} onPress={() => setUserAge(UserAge.LESS_THEN_15)}>
        <Text>Mindre än 15</Text>
      </TouchableOpacity>
      <TouchableOpacity onPress={() => setUserAge(UserAge.BETWEEN_16_AND_19)}>
        <Text>Mellan 16 och 19</Text>
      </TouchableOpacity>
      <TouchableOpacity onPress={() => setUserAge(UserAge.BETWEEN_20_AND_25)}>
        <Text>Mellan 20 och 25</Text>
      </TouchableOpacity>
      <TouchableOpacity onPress={() => setUserAge(UserAge.OLDER_THEN_25)}>
        <Text>Äldre än 25</Text>
      </TouchableOpacity>
      {userAge !== UserAge.EMPTY && <Button title="Next" onPress={() => {}} />}
    </View>
  );
};

const styles = StyleSheet.create({
  sView: {
    flex: 1,
    marginTop: 100,
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

export default AgeScreen;
