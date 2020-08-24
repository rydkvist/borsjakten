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
              iconName = 'book';
              iconSize = 24;
            } else if (route.name === TabNames.SETTINGS) {
              iconName = 'gear';
              iconSize = 22;
            } else if (route.name === TabNames.GAMES) {
              iconName = 'rocket';
              iconSize = 22;
            }

            return <Icon name={iconName} size={iconSize} color={color} />;
          },
        })}
        tabBarOptions={{
          activeTintColor: colors.aqua,
          activeBackgroundColor: isAndroid ? colors.white05 : colors.white,
          inactiveTintColor: colors.grey,
          inactiveBackgroundColor: colors.white,
          tabStyle: { paddingVertical: isAndroid ? 10 : 0 },
          labelStyle: { fontSize: 10, marginTop: isAndroid ? 5 : -5 },
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
