Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4CEF219E8
	for <asahi@lists.linux.dev>; Wed, 22 Nov 2023 23:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="EJhSA78A"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 5579887671;
	Thu, 23 Nov 2023 00:52:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1700697163;
	bh=MfMtXu9oCMCJQk9r9TxXb60YIWYQLiOl2RLjKSNovJc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EJhSA78A7QS5wcQTN8n/5kJPfQgaDAVv7DVq0s3W19k+alj8P0EHSrXDoocO8QWpX
	 NYuuMAsovbi3NMRbjaWVhVkLkHuclrM0h82v3ry6kVDaxk+3BwoNk1HWAkV4vhK0Jr
	 kdJD9p7KjAcJ/5ZjEANVkAdY2i8y38Oaq6YS3hWTchTYYIYOXKQwC1FeJJIM70mXPo
	 i6Oll5xZapoTrooP50wIwuByqDJwdAfkNRZctPmFXLIMmQniHJOnthoAXcAojbCR1A
	 rDrzwqtoYVKOpJc7psUE95fbpOeIZ6/rTcmxBmG63OZcDgEVnbx6DcOYoqxUJiH/bz
	 zqXGJk0xEY5vA==
Message-ID: <e9675b13-41e8-442a-ac02-3a625c31ee22@denx.de>
Date: Thu, 23 Nov 2023 00:52:40 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] USB fixes: xHCI error handling
Content-Language: en-US
To: Hector Martin <marcan@marcan.st>, Shantur Rathore <i@shantur.com>
Cc: Bin Meng <bmeng.cn@gmail.com>, Mark Kettenis <kettenis@openbsd.org>,
 u-boot@lists.denx.de, asahi@lists.linux.dev
References: <20231027-usb-fixes-1-v1-0-1c879bbcd928@marcan.st>
 <fe844c63-0c44-469c-a4e0-f0e1f2ac63fc@denx.de>
 <CAHc5_t2WFZH65MJENGvC6u21ETcRn47ceQd8jrHV9DVmmM10Vw@mail.gmail.com>
 <3b662808-e047-4023-a00c-1b6728bd5c86@denx.de>
 <cdb3df49-1ba3-4b87-bc2e-57c71a7ce725@marcan.st>
 <51d7ba01-bb22-4246-b67b-675511ca0be2@denx.de>
 <f6df901a-245a-494a-952a-c9bace244fdc@marcan.st>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <f6df901a-245a-494a-952a-c9bace244fdc@marcan.st>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 11/21/23 07:46, Hector Martin wrote:
> 
> 
> On 2023/11/20 21:15, Marek Vasut wrote:
>> On 11/20/23 11:45, Hector Martin wrote:
>>>
>>>
>>> On 2023/11/20 11:09, Marek Vasut wrote:
>>>> On 11/20/23 00:17, Shantur Rathore wrote:
>>>>> On Sun, Nov 19, 2023 at 8:08 PM Marek Vasut <marex@denx.de> wrote:
>>>>>>
>>>>>> On 10/27/23 01:16, Hector Martin wrote:
>>>>>>> This series is the first of a few bundles of USB fixes we have been
>>>>>>> carrying downstream on the Asahi U-Boot branch for a few months.
>>>>>>>
>>>>>>> Most importantly, this related set of patches makes xHCI error/stall
>>>>>>> recovery more robust (or work at all in some cases). There are also a
>>>>>>> couple patches fixing other xHCI bugs and adding better debug logs.
>>>>>>>
>>>>>>> I believe this should fix this Fedora bug too:
>>>>>>>
>>>>>>> https://bugzilla.redhat.com/show_bug.cgi?id=2244305
>>>>>>
>>>>>> Was there ever a V2 of these patches I might've missed ?
>>>>>
>>>>> Is it this one?
>>>>> https://patchwork.ozlabs.org/project/uboot/list/?series=379807
>>>>
>>>> I think so, thanks.
>>>>
>>>> And uh, my question therefore it, is there a V3 which addresses the 3/8
>>>> and 8/8 comment ?
>>>
>>> Not yet, no. Sorry, I probably won't have time to work on this in a
>>> while, currently busy with other stuff.
>>
>> I can probably fix the patches up myself if that is fine with you, I'd
>> really like to get these fixes into the release soon. Would that be OK
>> with you ?
>>
> 
> Of course, I would appreciate that :)

I picked a subset to usb/master and fixed a subset, for the rest I 
really do need your input on those patches.
