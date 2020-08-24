import 'react-native-gesture-handler';
import React from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';
import { StyleSheet, Platform } from 'react-native';

import Icon from 'react-native-vector-icons/Octicons';
import { colors } from './src/styles';

import { HomeScreen } from './src/home';
import { SettingsScreen } from './src/settings';
import { GamesScreen } from './src/games';

export enum TabNames {
  HOME = 'Börsjakten',
  SETTINGS = 'Inställningar',
  GAMES = 'Spel',
}

const Tab = createBottomTabNavigator();

const App = () => {
  const isAndroid = Platform.OS === 'android';

  return (
    <NavigationContainer>
      <Tab.Navigator
        initialRouteName={TabNames.HOME}
        screenOptions={({ route }) => ({
          tabBarIcon: ({ focused, color, size }) => {
            let iconName = '';
            let iconSize = size;

            if (route.name === TabNames.HOME) {
              iconName = 'rocket';
              iconSize = 24;
            } else if (route.name === TabNames.SETTINGS) {
              iconName = 'person';
              iconSize = 24;
            } else if (route.name === TabNames.GAMES) {
              iconName = 'graph';
              iconSize = 24;
            }

            return <Icon name={iconName} size={iconSize} color={color} />;
          },
        })}
        tabBarOptions={{
          activeTintColor: colors.aqua,
          inactiveTintColor: colors.grey,
          tabStyle: isAndroid ? { paddingTop: 10, marginBottom: 10 } : { marginTop: 10 },
          labelStyle: { fontSize: 10, marginTop: isAndroid ? 5 : 0 },
          style: isAndroid ? { height: '8%' } : {},
        }}
      >
        <Tab.Screen name={TabNames.GAMES} component={GamesScreen} />
        <Tab.Screen name={TabNames.HOME} component={HomeScreen} />
        <Tab.Screen name={TabNames.SETTINGS} component={SettingsScreen} />
      </Tab.Navigator>
    </NavigationContainer>
  );
};

export default App;
