//SPDX-License-Identifier: Unlicense

pragma solidity >=0.8.0;

contract EventManagement{
    struct Event{
        address organizer;
        string name;
        uint date;
        uint price;
        uint tktCount;
        uint tktRem;
    }

    mapping(uint=>Event) public events;
    mapping(address=>mapping(uint=>uint)) public tickets;
    uint public nextId;

    function createEvent(string memory name,uint date,uint price,uint tktCount) external
    {
        require(date>block.timestamp,"event needs to be of future date");
        require(tktCount>0,"event with no tkts cant be organized");
        events[nextId]=Event(msg.sender,name,date,price,tktCount,tktCount);
        nextId++;
    }

    function buyTicket(uint id,uint qty) public payable
    {
        require(events[id].date!=0,"event does not exist");
        require(events[id].date>block.timestamp,"event already occured");
        Event storage _event=events[id];
        require(msg.value ==(_event.price*qty),"ether not enough");
        require(_event.tktRem>=qty,"not enough tkts");
        _event.tktRem-=qty;
        tickets[msg.sender][id]+=qty;
    }

    function transferTickets(uint id,uint qty,address to) external{
        require(events[id].date!=0,"event does not exist");
        require(events[id].date>block.timestamp,"event already occured");
        require(tickets[msg.sender][id]>=qty,"you dont have enough tkts");
        tickets[msg.sender][id]-=qty;
        tickets[to][id]+=qty;
    }
}

