import styled from "styled-components";
import DefaultLayout from "layout/Default";

export const Title = styled.h1`
  color: papayawhip !important;
`

export default function Home() {
  return (
      <DefaultLayout>
          <div>
              <Title>Welcome to next</Title>
          </div>
      </DefaultLayout>
  )
}
