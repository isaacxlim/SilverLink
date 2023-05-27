import React, {useState} from 'react';
import { StatusBar } from 'expo-status-bar';

//formik
import { Formik } from 'formik';
//icons
import { Octicons, Ionicons} from '@expo/vector-icons';
//Colors

import { StyledContainer, 
    InnerContainer, 
    PageLogo, 
    PageTitle, 
    SubTitle, 
    StyledFormArea, 
    LeftIcon, 
    StyledInputLabel, 
    StyledTextInput, 
    RightIcon, 
    StyledButton, 
    ButtonText, 
    Colors,
    MsgBox, 
    Line,
    ExtraView,
    ExtraText,
    TextLink,
    TextLinkContent,
    WelcomeContainer,
    WelcomeImage,
    Avatar
} from './../components/styles'; 

import { View } from 'react-native';

//Colors
const {brand, darkLight} = Colors;

const Welcome = () => {
    const [hidePassword, setHidePassword] = useState(true);


    return (
        <>
            <StatusBar style = "dark" />
            <InnerContainer>
                <WelcomeImage resizeMode="center" source={require('./../assets/NursesImage.png')} />

                <WelcomeContainer> 
                    <PageTitle welcome={true}>Home Page</PageTitle>
                    <SubTitle welcome={true}> Welcome!</SubTitle>
                    <StyledFormArea>
                        <Avatar resizeMode="cover" source={require('./../assets/SilverLinkLogo.png')} />
                        <Line />   
                        <StyledButton onPress={() => {}}>
                            <ButtonText>
                                Logout
                            </ButtonText>
                        </StyledButton>

                    </StyledFormArea>
                </WelcomeContainer>
            </InnerContainer>
        </>
    );
};

const MyTextInput = ({ label, icon, isPassword, hidePassword, setHidePassword, ...props }) => {
    return (<View> 
        <LeftIcon>
            <Octicons name={icon} size ={30} color={brand}/>
        </LeftIcon>
        <StyledInputLabel>{label}</StyledInputLabel>
        <StyledTextInput {...props} />
        {isPassword && (
            <RightIcon onPress={() => setHidePassword(!hidePassword)}>
                <Ionicons name={hidePassword ? 'md-eye-off' : 'md-eye'} size={30} color={darkLight}/>
            </RightIcon>
        )}
    </View>);
};

export default Welcome;