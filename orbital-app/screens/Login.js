import React from 'react';

import {
    StyledContainer,
    InnerContainer,
    PageLogo,
    PageTitle
} from './../components/styles'; 

const Login = () => {
    return (
        <StyledContainer>
            <InnerContainer>
                <PageLogo resizeMode="cover" source={require('./../assets/SilverLinkLogo')} />
                <PageTitle>SilverLink</PageTitle>
            </InnerContainer>
        </StyledContainer>
    );
}

export default Login;