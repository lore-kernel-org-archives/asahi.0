Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE1771B3A
	for <asahi@lists.linux.dev>; Tue, 26 Mar 2024 12:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711454503; cv=none; b=p+SNDSznl5yrtSPsOKPVYCxU0Q2/jaAVwz+rbwst3UVEO7HxRfzwoZKPNlR6cRVuEvPdQnIbQ62jkXaX0ae4nvh87fD8pv1iHql3K7gyxooXA5JzgAsPKMjyxwc/sS8QMIru9b3OLpGbzJAhT1e4p18JZOpF4y7k32ohMjvwgMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711454503; c=relaxed/simple;
	bh=I04tyDFUTbJbcHAaWhhKlEJ6AFtiw2rTZ8P0SCjkbTo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hRStrrxUC7bO5RKwFitfn1ptWBzZVPS1JKg0hRkeO0tqrgrAwcOpoS6gke43bnDGm9Raoy6VtCxjlZFgNePNKX9P+klhyFDLMQ66Ixynyac5+aWushQENDTtnI926O4Q9auSuocfbr13c23mn5K7y6MHJhIF13FVenEgD9MqwwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=OM9yCSYu; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="OM9yCSYu"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id DB09287FB6;
	Tue, 26 Mar 2024 13:01:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1711454497;
	bh=NrE2drfcJ7REOMqq1da2UIxpVXF3Pm49HKKA1yvAyoU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OM9yCSYuKjnaOVSxSH09HaJ6IbStJ1+YU4OoE5Lfp+1oWTnPXUto55BiJdSIPetvr
	 bgSbIhFwwZ6HM4rdlybY/E9GAPT/9kakCQgtHuyF1rv78nk9YTYHYtztZxm8mAJgS8
	 2zdzal95/ChMani3ukA5vSMcY1urEZtHmhzUWR1AhuIpdR1z/7yZFCMOyl9Gvfg9Aj
	 s1svCa0sPc/bdZdwiF2dSOFzeA7jD7+VMB6YnLX2cYflL2014ayC30ZLxb9JiieAXj
	 b3SsZShVGKjXP4l+j6voLlmFOoORORbAfVlmKnW2aoFJaT19TSXMVavH2kgvF7D50+
	 R8lxT4VntQ48w==
Message-ID: <87b40ef9-c8fc-473a-bda7-13ccdf5275a1@denx.de>
Date: Tue, 26 Mar 2024 12:29:34 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] usb: Add environment based device ignorelist
To: Janne Grunau <j@jannau.net>
Cc: Bin Meng <bmeng.cn@gmail.com>, Tom Rini <trini@konsulko.com>,
 Simon Glass <sjg@chromium.org>, Joe Hershberger <joe.hershberger@ni.com>,
 u-boot@lists.denx.de, asahi@lists.linux.dev, Neal Gompa <neal@gompa.dev>
References: <20240322-asahi-keyboards-v3-0-3106dd4c4e19@jannau.net>
 <20240322-asahi-keyboards-v3-4-3106dd4c4e19@jannau.net>
 <fcc7e54e-5e52-4b27-bc0c-801954ccf0ca@denx.de> <ZgKKB_j02eAVltTs@robin>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <ZgKKB_j02eAVltTs@robin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 3/26/24 9:40 AM, Janne Grunau wrote:
> On Fri, Mar 22, 2024 at 12:56:37PM +0100, Marek Vasut wrote:
>> On 3/22/24 8:47 AM, Janne Grunau via B4 Relay wrote:
>>
>> [...]
>>
>>> @@ -1099,6 +1142,20 @@ int usb_select_config(struct usb_device *dev)
>>>    	le16_to_cpus(&dev->descriptor.idProduct);
>>>    	le16_to_cpus(&dev->descriptor.bcdDevice);
>>>    
>>> +	/* ignore devices from usb_ignorelist */
>>> +	err = usb_device_is_ignored(dev->descriptor.idVendor,
>>> +				    dev->descriptor.idProduct);
>>> +	if (err == -ENODEV) {
>>> +		dev_dbg(dev->dev, "Ignoring USB device 0x%x:0x%x\n",
>>> +			dev->descriptor.idVendor, dev->descriptor.idProduct);
>>> +		return err;
>>> +	} else if (err == -EINVAL) {
>>> +		printf("usb_ignorelist parse error in \"%s\"\n",
>>> +		       env_get("usb_ignorelist"));
>>
>> Please use dev_err() here consistently with dev_dbg() above.
> 
> I didn't use dev_err() since the parsing error is not specific to the
> device. It doesn't matter much. I'll change it and resend after we've
> settled the new discussion about the interface limit.

Then please just clarify this in the commit message, that's fine.

Thanks !
