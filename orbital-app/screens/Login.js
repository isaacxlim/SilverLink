import React from 'react';
import { StatusBar } from 'expo-status-bar';

//formik
import { Formik } from 'expo-status-bar';
//icons
import { Octicons } from '@expo/vector-icons';

import { StyledContainer, InnerContainer, PageLogo, PageTitle, SubTitle, StyledFormArea, LeftIcon, StyledInputLabel, StyledTextInput, RightIcon, Colors} from './../components/styles'; 
import { View } from 'react-native';

//Colors
const {brand} = Colors;

const Login = () => {
    return (
        <StyledContainer>
            <StatusBar style = "dark" />
            <InnerContainer>
                <PageLogo resizeMode="cover" source={require('./../assets/SilverLinkLogo.png')} />
                <PageTitle>SilverLink</PageTitle>
                <SubTitle> Account Login</SubTitle>

                <Formik
                    initialValues={{email: '', password: ''}}
                    onSubmit={(values) => {
                        console.log(values);
                    }}
                > 
                {({handleChange, HandleBlur, HandleSubmit, values}) => (<StyledFormArea></StyledFormArea>)}
                </Formik>
            </InnerContainer>
        </StyledContainer>
    );
};

const MyTextInput = ({label, icon, ...props}) => {
    return (<View> 
        <LeftIcon>
            <Octicons name={icon} size ={30} color={brand}/>
        </LeftIcon>
        <StyledInputLabel>{label}</StyledInputLabel>
        <StyledTextInput {...props}/>
    </View>)
}

export default Login;