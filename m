Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCF017991
	for <asahi@lists.linux.dev>; Tue, 21 Nov 2023 06:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=marcan.st
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marcan.st
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marcan.st header.i=@marcan.st header.b="roxzu6Mu"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 7882842137;
	Tue, 21 Nov 2023 06:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1700549215; bh=+VM56IWifyfr+4nKeejuFeJYZgFdQVpPoQf4v0u2B3Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=roxzu6MuR+FBIHWSxmGrERJT6L19yeWdF9EXvNPYMrexORQG6x68gnKkVRvm24vPY
	 bNCaGTpGDwWZkPSRcKlXwn0ELj5dlMUPlBeXRUEi52wr+pG0BoJqPoaItb4z8ALUtH
	 /yIpC6XQkXAchBU+8KUEPHb/mjozxu2xUHXPCHXRMVZTrN4RPVPQvO6SdMRmlKHXJX
	 9jxHK0kAXOKVojlRgYwD1lOomwKRTSW9CXaiI8qh4Xc2FKYOrf+tBAYJVGheWnDezl
	 h0bEXJ49R3bM4RodvnwpjcWszBk9Ri8/+wKfajkODwZOodJR+A/2wn21D/JLPMJa2O
	 Axb7hZF9w9F4Q==
Message-ID: <f6df901a-245a-494a-952a-c9bace244fdc@marcan.st>
Date: Tue, 21 Nov 2023 15:46:49 +0900
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] USB fixes: xHCI error handling
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, Shantur Rathore <i@shantur.com>
Cc: Bin Meng <bmeng.cn@gmail.com>, Mark Kettenis <kettenis@openbsd.org>,
 u-boot@lists.denx.de, asahi@lists.linux.dev
References: <20231027-usb-fixes-1-v1-0-1c879bbcd928@marcan.st>
 <fe844c63-0c44-469c-a4e0-f0e1f2ac63fc@denx.de>
 <CAHc5_t2WFZH65MJENGvC6u21ETcRn47ceQd8jrHV9DVmmM10Vw@mail.gmail.com>
 <3b662808-e047-4023-a00c-1b6728bd5c86@denx.de>
 <cdb3df49-1ba3-4b87-bc2e-57c71a7ce725@marcan.st>
 <51d7ba01-bb22-4246-b67b-675511ca0be2@denx.de>
From: Hector Martin <marcan@marcan.st>
In-Reply-To: <51d7ba01-bb22-4246-b67b-675511ca0be2@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 2023/11/20 21:15, Marek Vasut wrote:
> On 11/20/23 11:45, Hector Martin wrote:
>>
>>
>> On 2023/11/20 11:09, Marek Vasut wrote:
>>> On 11/20/23 00:17, Shantur Rathore wrote:
>>>> On Sun, Nov 19, 2023 at 8:08 PM Marek Vasut <marex@denx.de> wrote:
>>>>>
>>>>> On 10/27/23 01:16, Hector Martin wrote:
>>>>>> This series is the first of a few bundles of USB fixes we have been
>>>>>> carrying downstream on the Asahi U-Boot branch for a few months.
>>>>>>
>>>>>> Most importantly, this related set of patches makes xHCI error/stall
>>>>>> recovery more robust (or work at all in some cases). There are also a
>>>>>> couple patches fixing other xHCI bugs and adding better debug logs.
>>>>>>
>>>>>> I believe this should fix this Fedora bug too:
>>>>>>
>>>>>> https://bugzilla.redhat.com/show_bug.cgi?id=2244305
>>>>>
>>>>> Was there ever a V2 of these patches I might've missed ?
>>>>
>>>> Is it this one?
>>>> https://patchwork.ozlabs.org/project/uboot/list/?series=379807
>>>
>>> I think so, thanks.
>>>
>>> And uh, my question therefore it, is there a V3 which addresses the 3/8
>>> and 8/8 comment ?
>>
>> Not yet, no. Sorry, I probably won't have time to work on this in a
>> while, currently busy with other stuff.
> 
> I can probably fix the patches up myself if that is fine with you, I'd 
> really like to get these fixes into the release soon. Would that be OK 
> with you ?
> 

Of course, I would appreciate that :)

- Hector
