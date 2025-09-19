#ifndef _SmartPtr_HPP_
#define _SmartPtr_HPP_

class SmartPtr{
public:
	SmartPtr();
	SmartPtr( const SmartPtr& src );
	bool operator<( const SmartPtr& that );
	virtual ~SmartPtr();

private:
};

#endif
