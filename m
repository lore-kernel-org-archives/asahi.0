Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E15719ADA4
	for <asahi@lists.linux.dev>; Sat,  6 Jun 2026 16:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780764371; cv=none; b=gmQlmVkyXNdLoon8DbA7s3Wkvy2/dgbjGg5GzF5wcYcYhYKcc8hm2ep7rCaefnIdTzTp9/T/z0J0qIyRSScRMRYki9bk9syGD4VO9HFIyKkLOb7I6RSLXPcovsL+gDgV89+AdMAPojLaHMTO7ti/F6F3WIgUfCCu9rtyfGbw08M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780764371; c=relaxed/simple;
	bh=Ff8Fy4eHBG4/BzHVJkR4pQSm6mkilhlVqPXSRn/JWGs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p6xi68wvnpnA3qiUSqAEr6a2pTTx3j7D8d1VADVbrEq0kcFOo0EBITJ3qzVSnC6T8h4SkXlc+dKewCMkir+b+H0rhZ5Ns6R1AC+vdacCfwGjaeffETNN3jmezNQkzGdi+peOk7r/BWesTE5adExsKHwIHg5gJzTkwWRBWqQaKBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BDjvEA3k; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BDjvEA3k"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-36b903567fdso2986989a91.1
        for <asahi@lists.linux.dev>; Sat, 06 Jun 2026 09:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780764369; x=1781369169; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0CCEPdnbAf9O7YZGI5gomWMwSVZTv0vCb5M8aGMFXew=;
        b=BDjvEA3kYWad8IlmKWKC1v08CKVaLU8wc+SvnthX+RJE9nQJPycXmYglkwV1vi+p5w
         oTD1VSb0xe7eJ5OFM8T0PYeC+b+4rATl632V8Wfcii2gIiSf5Edqlp9zYMi0mjaDl5OK
         QygheLJrDY5PDSb88UVwGArmg+8bLaMF7epSQCcl5Aw/sPR7MyMY+o0DTtBdueEBVj8P
         pXn9cHZWDQhou51PmUFFYM71WchvAqazPosXO7zIIXo+NQNCFOgi5ba6bNYp83XdvcoK
         /Z3LCEs6Hrz1RtqXKs5u06jD2te9OYGxEsJK+cTj7cQLfGc+oAdGryOUKQgKxdRtxFqA
         BOJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780764369; x=1781369169;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0CCEPdnbAf9O7YZGI5gomWMwSVZTv0vCb5M8aGMFXew=;
        b=BupAryvY/UxegwaeDASd4yF1RQBM1hlpYAiGDz+/mzJiUr7vcLPEp0EmwylWdWgvT1
         F38Xal7NUM7b25Cei1vn65YkPMuOh+wJAmCFP451yrEZTu+fOASzrvB2CdkpwocTA2oZ
         pgjGu6cTnERyodEyyGfqIOzE+MdQrfwQ2AAUGgbsBOhPWumL1ewDV7b4oSrjsjtQzFvL
         Ar+9qZ8NHtdki069wqG8t7vXDvR+pw5gGKGgs3w726rt3/LK1Ia7Cl+XPoyBAdK7pZE/
         L7dp7icJBA2yvu7Ii4Zsc2GOG4LnF60vvlpi35GsAG5d6ErGtQURWKUFZaykx0v1gcjQ
         wk8g==
X-Gm-Message-State: AOJu0YxkRSLnjngo8HDYS5xWwtNQ3COsDiIztGk5MfgUZ3O5DOXXs3vV
	oagYXmLBExP4kL/fyMRD0jpPaJuzh6WUHvZiu0pB/a5OzOGHgbgK04nx
X-Gm-Gg: Acq92OHxvXPT4BsWi5J6v+eI9SFcGiHeSSnRJSLGr93oUTShAnvPFtLec2NTxg4rqkW
	pIxVEnaJ7r+xGNgqVyaHphimmHHMJS0KC8hgabx33w22+aaTfS1SqOd961xsXfmRJIWb2XSYQlq
	h0hg96fWXcOXLmwrh2AheovQsAx5c6aajZtXdZMuUqtzogOXTijtbjzl2XbemXtvHnfwLgxNu4I
	Uqo1RiN45WT4UbZCFlnq+nDkhL6v/Cvcq2PGt/MqLQaBY/cwflfJ0tG+c9exdBk/9njcztPGMla
	gpqo0xC81uZwcFXAaixGIqOTwg/kowP+ZExbzMN5+64COj0SAXjndCO9mlrz0BpnKRKwE32W1Hy
	MLThmdxdnX2TqSWiD1CaiL5cSTZ+sCQYJ1vyS9ddYE6R+TIvcW+h7Tqy3mHSgM2Szt6BOCjGppA
	3T0PIDv5uMEDUS0a43xkp2O8JKmjhI3SdScKtyinu+LQ==
X-Received: by 2002:a17:90b:1ccd:b0:368:a297:bd38 with SMTP id 98e67ed59e1d1-370eedfff8dmr9852447a91.7.1780764369256;
        Sat, 06 Jun 2026 09:46:09 -0700 (PDT)
Received: from [192.168.1.111] ([223.122.38.120])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f714e26afsm10414758a91.17.2026.06.06.09.46.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Jun 2026 09:46:08 -0700 (PDT)
Message-ID: <b791aed1-cd05-45cd-973b-4d8bef27ee7c@gmail.com>
Date: Sun, 7 Jun 2026 00:46:03 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] nvme-apple: Prevent tag collision across queues even
 if tag space is shared
Content-Language: en-MW
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Yuriy Havrylyuk <yhavry@gmail.com>
References: <20260606-prevent-tag-collision-t8015-v1-0-93ccf4eca550@gmail.com>
 <20260606-prevent-tag-collision-t8015-v1-2-93ccf4eca550@gmail.com>
 <a0b0bea4-998e-4196-a2b0-9fcaf531d9f3@kernel.org>
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <a0b0bea4-998e-4196-a2b0-9fcaf531d9f3@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



Sven Peter 於 2026/6/7 凌晨12:12 寫道:
> On 06.06.26 15:25, Nick Chan wrote:
>> From: Yuriy Havrylyuk <yhavry@gmail.com>
>>
>> Apple NVMe controllers require tags of pending commands to not be shared
>> across admin and IO queues. However, on Apple A11 without linear SQ, it is
>> not possible for either queue to skip over some tags and must go from 0 to
>> the configured maximum before wrapping around.
>>
>> If a pending command tag is duplicated across queues, the firmware
>> crashes with: "duplicate tag error for tag N", with N being the tag.
>>
>> Instead of partitioning the tag space, which is not possible without
>> linear SQ, 
> 
> Isn't that just what the pci.c driver does with NVME_QUIRK_SHARED_TAGS 
> for the T2 macs or what we do in this driver with
> 	if (anv->hw->has_lsq_nvmmu)
> 		anv->tagset.reserved_tags = APPLE_NVME_AQ_DEPTH;
> ?

After adjusting the apple_nvme_submit_cmd_t8015() function to account for
the admin queue depth, it seems that the existing workaround for M1 of
reserving two tags for the admin queue works on A11 as well.

Will post a much simplified v2.

Best regards,
Nick Chan

> 
> 
> Sven
> 

