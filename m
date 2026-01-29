Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855132EDD76
	for <asahi@lists.linux.dev>; Thu, 29 Jan 2026 18:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769711205; cv=none; b=WfMBLc6t6iw0RtZGd+OwRtiqKbBSh9rTDwaP8+mi4kUqoD5QzSpRGn/LAJlfiz/lm4VeQjxwh4JJj/TGSLjJvXIcAuuYKm28NzcfxJNj+jyvdQ4OUifI3CJbARm1xHF6RL13JZrFEBur84/QfLceyEHjvSDksvTJGEU7LRNNSPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769711205; c=relaxed/simple;
	bh=750IC68QXJEbN7HS5fWJu1zjfFuvlcy4ol1eYKG0Xso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Usr3wGPNyqYHZNElf7eD0LagIwg++0TBoUWxrI+l4KwHEr7NKGqMWtU7D2jyWW7sJq0C2j1rHhxWpqIL+h8FiJdCcgbCnhfdniFH7BCSj0Gy1FlXbkGkNjEv1eMZBgG3LYkhEI2LIXBUgW0lYDbDWNHy1yvMDwDniJNevCXyF+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EdMbxitT; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EdMbxitT"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2b6fd5bec41so2695877eec.1
        for <asahi@lists.linux.dev>; Thu, 29 Jan 2026 10:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769711204; x=1770316004; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PawX3KzIT+Wd97t0MV3ya2da2NCqSC6KlxI9la8dFAI=;
        b=EdMbxitTqWdytqO75G91ol3yjK2rCcxvIpDHxeT0jra1CxCfJ/KrPoJ2qQCxCE5hr7
         ghMiZuzCXFjzhld+4zmzh985x27pne1isEOe++P/8P9LlXRqqd/bmjnRm+WkZpLv2eDh
         6l9DA2SW9HNF6gzOZ4BYwzNlylHbPbU7rhfDpmNtOcaQjP28obBMglFoCa+Ja62RQDGm
         PbRij6xx7sE4NUHWmCRcUZo9KmSM6mHQTp+Jd9/9AE/JQkeBdi0CV2OuHDf+pyadZQV4
         Wxl7p3xtREGAO7KcLwc6ROA8hbPbmIrgRvctYr1E8oj2Z0+JMfzcAW9Cp28leXGYtfqP
         oiVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769711204; x=1770316004;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PawX3KzIT+Wd97t0MV3ya2da2NCqSC6KlxI9la8dFAI=;
        b=kMFvXdMtF92Rx1bU4fG0Slgc40wDckD90KDZVMsdYtC7WhWg5h4xPJg6/YkMtPOjZn
         WpQ4qSXgfnplZXgUTdOMA7h4DRoQWORpH6nTCeEuDFDu6rBG9XIkT88lfYPdVOTGyxvm
         QQTuJpI5zcFZ/Es9Rx2hLg78dkar733d9bZgV9bIZDfPey6u7f41ZWvOg8ake7uEUx43
         n7myQJtrnS9umQbqAFyTywebbyD5fnLDAbY6TLRjsNLtqMjxPcuO/ryB2u204CzAmOpz
         1ouNm5iXkffyAP7hXPN1CcRxLe6nIpjvOXjzZaOkWlKWRUaXkpald8COG3RXqz7f3Ffz
         wPrQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+wIsnyr7ST6ASYgRI4C71b+txnH6HEsa06ZEdvt1nl1xFGHVsWQuiftPwRvnlFgoeuHExeQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyPB6+Oxa8Q/VssCOFEKUkBxZ3Bowga714UwY8z879fMi8AID+g
	WTHH00wDo2WGh6srBIbX7Y95MP7u4kmbpJz1keU1c6MOZmHUsO01HSK8
X-Gm-Gg: AZuq6aIcrbdOoxKxSqISMlnM/rIY0zfdjPPpLHOGs68LUYf8NCOwKVaF2R5FQOLRxsr
	D5htpVhn/NMn5EWh3lejBcRSBRa5Btbt3BxN2PZjwpJorxhoL4DGPoeLdv6MGhU6044FiAEdHXD
	MxBmseRvsMNX1N8lxb2y7THYUQodEU2bfnUx0xn03gBjJyO72tGoi2UEFZpPi4OZp8pJbpt3Wjf
	wWvzuKlg6yzPkHeO6aQvxdEk5pCkfiMy9M1P5tA1PQaYSPnaz3JGXKjLimehjOknuJWEpt7gSMP
	yt1IX0SpVDC3PxWEHPBjew4FFjhfXMH69IsIhw2SfNy1q7Rl4zTh/Kzxvv46B/sDVxV/dgDIzbm
	+KkT8D+D0nAtSf7QM3O9I6ys/EAfA/ZvhYefWfTBm5Y22ZvIcDaEPf6SEJ0L2gDqWS3aQn0xpY/
	8UNxnsj7RF9tXf5mp1CKq3fVtH
X-Received: by 2002:a05:7301:3d15:b0:2b7:2dac:5853 with SMTP id 5a478bee46e88-2b7c8626756mr159908eec.2.1769711203599;
        Thu, 29 Jan 2026 10:26:43 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a16cfc73sm7912716eec.6.2026.01.29.10.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 10:26:43 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 29 Jan 2026 10:26:42 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Nathan Chancellor <nathan@kernel.org>
Cc: James Calligeros <jcalligeros99@gmail.com>,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	asahi@lists.linux.dev, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, Justin Stitt <justinstitt@google.com>,
	Neal Gompa <neal@gompa.dev>
Subject: Re: FIELD_PREP failure in drivers/hwmon/macsmc-hwmon.c
Message-ID: <56e7dcd2-2d09-439c-b8b6-82c2a1bd9c5d@roeck-us.net>
References: <20260119195817.GA1035354@ax162>
 <010a8554-6413-42ff-8d73-1811dffbb5dd@roeck-us.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <010a8554-6413-42ff-8d73-1811dffbb5dd@roeck-us.net>

On Mon, Jan 19, 2026 at 03:52:04PM -0800, Guenter Roeck wrote:
> Hi,
> 
> On Mon, Jan 19, 2026 at 12:58:17PM -0700, Nathan Chancellor wrote:
> 
> James, please have a look.
> 

I didn't get any response, so I submitted two patches which should
fix at least some of the problems with the driver.

Guenter
