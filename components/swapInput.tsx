import { Input, Button, Dropdown, Space } from "antd";
import { DownOutlined } from "@ant-design/icons";

interface ISwapInput {
  name: string;
  items: { label: string; key: string }[];
  value: string;
  setValue?: (value: string) => void;
  disableInput?: boolean;
}

export default function SwapInput({
  name,
  items,
  value,
  setValue,
  disableInput,
}: ISwapInput) {
  return (
    <div className="bg-[#1b2236] w-full h-[120px] p-4 flex items-center rounded-xl mb-4">
      <Input
        value={value}
        disabled={disableInput}
        className="w-[80%] h-full text-5xl bg-inherit text-[#b8c0dc] border-none outline-none"
      />
      <Dropdown
        menu={{ items, selectable: true }}
        placement="bottom"
        trigger={["click"]}
        className="h-[35px] bg-[#404a67] rounded-lg w-[20%] text-white"
      >
        <Button className="border-none">
          <Space className="flex justify-around item-center">
            <span className="text-xl">{name}</span>
            <DownOutlined className="flex items-center self-center" />
          </Space>
        </Button>
      </Dropdown>
    </div>
  );
}
