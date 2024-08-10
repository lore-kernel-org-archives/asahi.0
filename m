Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37D41B810
	for <asahi@lists.linux.dev>; Sat, 10 Aug 2024 11:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723288525; cv=none; b=FVbRM6Bui07orfYxOXoDfA+tPIEzReERsXVqOHn67TnCl5o9uvAIQFgdorLoQ1GE3+W2wfXtlHfBSqnAB7TIB1dYx47jCJOnf1S6pL1P4Rfu/iwh9tvOR0b3mza9JF1Z54KTOc36rM3sjqa8TS5tiaae16sNsTywHo8JRhtRIdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723288525; c=relaxed/simple;
	bh=/AGpnyCGOcrUhFH+QhwHIGn0YZ4bQIeXQ/kX5/UzP/8=;
	h=From:To:CC:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=ptpP7gNDC6zh5FC2+CMziIUkNljIu9m6sBMcGKxxDbpwHJCG0vAjr88+JgQtT2ugF08WfzRZOKXeT1uQnq4vkDViGmUOPXu+aAeJpX4Z6lFKyCJ0pEbYqc5T4Y0exfzCGMq1LmiUvx82kgIKkli7Xi/XQJFEAwG1Tt4vX6SXrIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=W0FoQwaY; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="W0FoQwaY"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a7a9e25008aso348564866b.0
        for <asahi@lists.linux.dev>; Sat, 10 Aug 2024 04:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1723288520; x=1723893320; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JyREcqbRzvE7tBa4QH5d0FeClLIHYh+fPSCpyZ6XaX0=;
        b=W0FoQwaYUfPreDvVcjrQtlj02yyDUAYFBZOFF1VqO6Cpw9MbUEZSbERLxTTKpRMphZ
         RKa9iDMnOd2ggMX3C+HsJQtPdfhYIDzXwvlXDUfMG1Xe59CHeuASFlF7Q3R31CO0ZS33
         QClx0I2x/InMzUO6CT+6h6HeCgjxIWyDoSDiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723288520; x=1723893320;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JyREcqbRzvE7tBa4QH5d0FeClLIHYh+fPSCpyZ6XaX0=;
        b=MozWg5JSM4xOp9qGYZBACJO6MCOSeUQRLJLDL6XTA8Y4ZDWy7xCfyeZa5BrFIWQfPX
         F95LhYDNIdS36mF0kDrNYawhnkacPLcOKObSvTq73ZHIeqfVI9LUmfd0+NcfTLryj4ni
         wvvgHr4vDrfAbmDBxly2d57jAFrzwSXmQ5HBbXChJzCmQKRTg7L8zIjC9aqtYlWW322j
         MV3/G8+JdfdRuddMUphV2GzowOsw9YWwoBOAkp6Bp2hG8WYk+tEMAG8vz64ir/6BFblC
         vTv8MU3BuuM5m4DdbpZ5yIBJ3ZT3m4FDnJ0Cr9CcuzybStjc+7RrSKbjoxg5sxpajn9a
         xVvg==
X-Forwarded-Encrypted: i=1; AJvYcCXQ/DQ9T1+H4WUMpu6oJgZ2VvD5VAm85R3XFQqzIFyr48CLLOnZ4NoJToxiUbFItgcDmV4ddo4yy8sPzQtUHx5lt7sW6Uw=
X-Gm-Message-State: AOJu0Ywo1zwxynasSlHkkXjWYZEV+Or3j+7FOjV+4JexYH9dXw6QcY1e
	DTXT/LLqIrGXUIgWzr023VdchZuz2II6rSN0heZClZI5RvBgrpFAV5+m1l4iow==
X-Google-Smtp-Source: AGHT+IHpXql5JpAa5ikTcA+o71dpL0i1v1hx9upMm8hoO62se/4vP1cyYBrGhn2WcAyzVkbs7yhovQ==
X-Received: by 2002:a17:907:c7c5:b0:a7a:9f0f:ab26 with SMTP id a640c23a62f3a-a80aa59b3dfmr344277366b.23.1723288520055;
        Sat, 10 Aug 2024 04:15:20 -0700 (PDT)
Received: from [192.168.178.38] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80c7ceaf06sm7942166b.88.2024.08.10.04.15.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 10 Aug 2024 04:15:19 -0700 (PDT)
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
To: Janne Grunau <j@jannau.net>, Jouni Malinen <j@w1.fi>
CC: <hostap@lists.infradead.org>, Vinayak Yadawad <vinayak.yadawad@broadcom.com>, Aditya Garg <gargaditya08@live.com>, Hector Martin <marcan@marcan.st>, <linux-wireless@vger.kernel.org>, <asahi@lists.linux.dev>
Date: Sat, 10 Aug 2024 13:15:19 +0200
Message-ID: <1913bfffd70.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <1913be30f30.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
References: <92fe4dd4-21a4-4559-8441-32ef86672de6@app.fastmail.com>
 <ZrclLHJ63RxnG/B3@w1.fi>
 <d82c88a2-77f7-4308-97fa-c5b4446e2cf5@app.fastmail.com>
 <1913be30f30.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
User-Agent: AquaMail/1.51.5 (build: 105105504)
Subject: Re: wpa_supplicant 2.11 breaks WPA2-PSK / WPA3-SAE authentication on Linux' brcmfmac
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit

On August 10, 2024 12:43:43 PM Arend Van Spriel 
<arend.vanspriel@broadcom.com> wrote:

> On August 10, 2024 11:17:56 AM "Janne Grunau" <j@jannau.net> wrote:
>
>> Hej,
>>
>> On Sat, Aug 10, 2024, at 10:30, Jouni Malinen wrote:
>>> On Sun, Aug 04, 2024 at 02:23:56PM +0200, Janne Grunau wrote:
>>>> wpa_supplicant 2.11 on Linux's 6.9.y / 6.10.y brcmfmac driver runs in
>>>> authentication timeouts with WPA2-PSK and WPA3-SAE. This was reported
>>>> with Apple silicon devices using Fedora Asahi remix with a patched
>>>> driver as well as other devices without additional brcmfmac patches.
>>>> See https://bugzilla.redhat.com/show_bug.cgi?id=2302577 for some
>>>> reports.
>>>>
>>>> I've bisected this to
>>>> https://w1.fi/cgit/hostap/commit/?id=41638606054a09867fe3f9a2b5523aa4678cbfa5
>>>> "Mark authorization completed on driver indication during 4-way HS
>>>> offload". Reverting this commit on top of hostap_2_11 properly
>>>> authenticates the connections. Looking at that change and the code it
>>>> looks clearly broken to to me. As far as I can see is
>>>> `assoc_info.authorized` for the nl80211 driver only set when
>>>> QCA_WLAN_VENDOR_ATTR_ROAM_AUTH_AUTHORIZED is set (in main, I did not
>>>> check older revisions). This doesn't seem appropriate to expect this
>>>> on chipsets from different vendors.
>>>
>>> This commit is from Broadcom to fix some race conditions with the 4-
>>> way handshake offload which I'm assuming is for a Broadcom driver..
>>> Whether that is for brcmfmac is unknown to me, though.
>>>
>>> It looks like the goal here was to move completion of the connection
>>> from the association event to EVENT_PORT_AUTHORIZED, i.e., the
>>> NL80211_CMD_PORT_AUTHORIZED event from the driver. Is that event not
>>> delivered by brcmfmac? I did not see any full wpa_supplicant debug
>>> logs for these issues based on a quick look, so I could not check
>>> that myself.
>
> I was surprised to see this was coming from Broadcom. I did not yet contact
> the author for more details.
>
>>>
>>
>> The following place in brcmf_bss_roaming_done() is the only place where
>> NL80211_CMD_PORT_AUTHORIZED event is posted.
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c#n6402
>
> Right. This seems to be added exclusively for Fast BSS transition scenario.
>
>>
>> In my initial analysis I missed that the NL80211_CMD_PORT_AUTHORIZED is
>> delivered directly to wpa_supplicant.
>>
>>>> A revert looks to me like a possible/proper fix. I can send that
>>>> later if no alternative materializes.
>>>
>>> I'm inclined to revert this if it is indeed the case that
>>> NL80211_CMD_PORT_AUTHORIZED is not delivered reliably by the upstream
>>> driver and this commit was tested only with some non-upstream
>>> versions.
>>
>> I intend extend the upstream kernel driver to post
>> NL80211_CMD_PORT_AUTHORIZED after successful connection with
>> authentication offload. I expect that the change will be accepted for
>> the stable kernel. Infineon/Cypress have non-upstream patches for the
>> brcmfmac driver which implement it already.
>
> Do you have a reference to see what they have done?
>
>> A revert in wpa_supplicant might be still appropriate until exteded
>> kernel drivers are deployed. The wpa_supplicant Fedora package carries
>> the revert as patch:
>> https://src.fedoraproject.org/rpms/wpa_supplicant/c/c2eac195adadd2c48b04f8752cc46b12a351e69
>
> Agree that revert makes most sense here. So what upstream drivers use WPA
> offload. Only brcmsmac and QCA drivers?

Obviously mean brcmfmac here. Autocorrect is mostly wrong ;-)

Regards,
Arend



