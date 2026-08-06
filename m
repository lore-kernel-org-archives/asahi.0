Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37AA381E8A
	for <asahi@lists.linux.dev>; Thu,  6 Aug 2026 16:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786035053; cv=none; b=IlloiE3V0d8Ofq/zCrNmnIKpMaggIhs4Jkp6f4dSKmCWm+6xUgYaF5tfY2APBTx/m1mcgNfXRUrLYpwMcqyvKXR6YnTXkj40x5VK9kD6pM8Vbj+aQEjoBNReZ/7FXciyJrDJAINmzMPMtEdN5yiNNtSCxc0fDpU87lwvnKA6HHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786035053; c=relaxed/simple;
	bh=7fHTowmCuTPX4X4NEfGSqGZeshkbcsulBw5ZLhqhO7A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NQvl4NKj4zPmgXV//Bn+UdU4lgChjXg2DSjEEioM/7PtNxkca+WTchKPE9k/4EXiub8NKmxtXmUbk6xbIzjZ838IAKv5TTMPp5uvrvcJuIAEHr/wYYrN4McZbw5n8YYiZUON6roKEm2OEHNgsQINbiov3VLw8cRz6cUNPuYLGmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dwd6I/DI; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dwd6I/DI"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cc891373e0so30460645ad.2
        for <asahi@lists.linux.dev>; Thu, 06 Aug 2026 09:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786035043; x=1786639843; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UpSZxsO2+OojqlTHRs9iVFREpITIpLS70LTpaRzcVr8=;
        b=dwd6I/DIs3xzhnBrwhUMTCt0QpfE+ZunYlqQOuXmQuhZ8QgdVMe1BnwaemoPrODybX
         vIgH+nSI7IeI98AsLnyPD1V8MnYHVLNNMMCyPonHeLXiLp3JbySzaaegJckn+zLxt7an
         VyE476514xNwrjxDYq4UO0V9s3Kg/JBbf2kP/+VKDmoL7m0ylBrKmQDtWSU/rePgoP9J
         84FazuuRJLkhrUb7ZoYg91NQZr7aOLpGeyn3xeRiut5vzDK8bOYwSNsWlNBrya05IGFe
         VRGQeuRyifV+itQxnAP0ir586QUAVms5nmxzzqKdZm1idIPd4UCYCEIyT3b1TN+D9yZU
         OM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786035043; x=1786639843;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UpSZxsO2+OojqlTHRs9iVFREpITIpLS70LTpaRzcVr8=;
        b=TWIvFRHTZcpTmMvNhEFgsBR8fNPFP6ZD2TZ8aUu7hick0svtiI/UutvBAk+Phap6js
         GvSxedEwOZmvzHR1R3ABHGHJHBlnQgUJ8QtfTI1t4uf98IbLPzszt6VVgfOKlweREBKg
         i+hhjugCZYpyPij7AzBvCkki24eFlpqc12JyIWzJsjzvie0w33H+sMudIhTRcPl7bE8w
         4+zuQLWHI93eO9gpcv8sA9P+44+SeCBvsSH3tJat+bASAL30H+zX+uJezjzACcxeCxak
         JyJC6fnBqNIOvP220orBpSudDn6CIFh9wt1K5HsgZ3aooEr8/EX7F9rnmPXX6IdzyfJL
         9Q5Q==
X-Gm-Message-State: AOJu0Yx1yiSG2zTalD9C+MCl6Q/3zkRwYXCv4uSuqBaYuwS6U5VK6jg0
	ED3/gP0fCx95B5K0KUCt3ZRRoNP6ZFIUnsH8bKJh6bra+pAb+3nfdnqA
X-Gm-Gg: AR+sD12GE6qjiFiMArHr51HkSd7aQLOoYiGIc1TySblwDLYZuxQiF6jKNT77efPrWLT
	8rbl6mfZfgHqktlUY4wMunCniUBoRwRgtj4v36Zqp5fE4IoipuevaMYoSwkA7iBRE3bwPts+fPO
	ASd7tvExwrD6nJ6rY61XCVTmjGhYAhGBo0CBaxdmH6RcXLY4clxYPDkuN0kmvnXG46llSYQLB/Y
	TKdqbP0PSFwkIroAnBwACkLKyngS5SZsxYNmFXxOKXRhrjf6uK2+ULB+rtC8nUR87WWpqIFxzAo
	ywpkYtwoCGNP6Xa7P/N2u06C7t/BnOa9GPgitqeLfOedSxGQeKm05E+DgETOANVCVaStbeAgMcF
	MyrUcSZyHdUwNnWtvnUDMI9t17rvstKEal8SytBWxyR48QWnzVVonztaIxHJ89YfkGHa1c4gGo3
	j0JT6R1/2x2sz257yKP5obhf1vrO1S+8N6Gf99Rn14LfBYL8I0Z5Ck7zu0z12Pz+P4tR5P
X-Received: by 2002:a17:903:2ac5:b0:2c9:b8b7:5d27 with SMTP id d9443c01a7336-2d0ca712d8fmr201739305ad.1.1786035042793;
        Thu, 06 Aug 2026 09:50:42 -0700 (PDT)
Received: from [192.168.1.113] ([223.122.38.120])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0aa4ec8c7sm34434975ad.80.2026.08.06.09.50.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 09:50:42 -0700 (PDT)
Message-ID: <0ea8c38b-0230-4ef3-acac-e43208d7c9b2@gmail.com>
Date: Fri, 7 Aug 2026 00:50:38 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] Apple NVMe fixes for macOS 15+ firmware / M4 support
Content-Language: en-MW
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, Arnd Bergmann <arnd@arndb.de>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260806-b4-nvme-fwabi-v1-0-bde19ce8db04@kernel.org>
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20260806-b4-nvme-fwabi-v1-0-bde19ce8db04@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



Sven Peter 於 2026/8/6 晚上11:27 寫道:
> Hi,
> 
> This series fixes a bunch of bugs that were working fine with M1/M2 NVMe
> controllers with older firmware but are now starting to bite us.
> With macOS 15 a new firmware is installed for the controller and both
> XNU and the controller are a bit more strict now. This firmware is
> required once we add M4 support.
> 
> The first patch fixes a panic that can happen when the controller fails
> to initialize, which now happens for the first time with the new
> firmware. The other fixes then make it work again.

For the whole series:

Tested-by: Nick Chan <towinchenmi@gmail.com> # pre-M1 controllers

> 
> Best,
> 
> Sven
> 
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
> Sven Peter (6):
>       nvme-apple: Destroy the admin queue on removal
>       nvme-apple: Don't set a DMA direction for commands without a data transfer
>       nvme-apple: Never set the opcode in the NVMMU TCB
>       nvme: Add a quirk for page aligned admin queue buffers
>       nvme-apple: Require page aligned buffers on the admin queue
>       nvme-apple: Drop the PRP null check chicken bit
> 
>  drivers/nvme/host/apple.c | 32 +++++++++++++++-----------------
>  drivers/nvme/host/core.c  |  5 ++++-
>  drivers/nvme/host/nvme.h  |  7 +++++++
>  3 files changed, 26 insertions(+), 18 deletions(-)
> ---
> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> change-id: 20260806-b4-nvme-fwabi-000386148b21
> 
> Best regards,
> --  
> Sven Peter <sven@kernel.org>
> 
> 
> 

