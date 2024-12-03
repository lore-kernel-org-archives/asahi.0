Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339A81E411D
	for <asahi@lists.linux.dev>; Tue,  3 Dec 2024 11:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733226915; cv=none; b=Uh3Yw0xBJ1RAb48/3ASzD0vKJRUg234vQd7ILoRmnf09RbGOhaGrygjn4IyqkR68l/O/Z45HGU9cKgCnfyqfVuy4CbgdEE1BaErqqX0u1p8eab68kP7nwKDNpp2A9hKUOYS0i6uI4CjNz0FjSRmt69IzmDMBrB8nwubNMCXPOR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733226915; c=relaxed/simple;
	bh=v8zoQZ6dwqd3xojwqV6vSH8uy1LrM8PkPp2K6MbPIqU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JR/kOOi91G7KXQ/CL7eOQqa0ezCpvpN4TpwgXFD0W0rFojFPtHWSIY/y6AuL+GAJ+pG546gInYcWP5susVdk5Vrs1SHeWA2iCa5a7wl80aru2OpAtVs6HJ3FDrWmknU6I6+KGbVdzrkkxdCEg3/IYq7djxpesyTwsOpmHXNobZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=YYxQJtEL; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="YYxQJtEL"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-434aabd688fso34892475e9.3
        for <asahi@lists.linux.dev>; Tue, 03 Dec 2024 03:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733226912; x=1733831712; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=on3sYEGd2/W0CVrqLqHMmcTuEZdP/rp7cfagL/Up9EA=;
        b=YYxQJtELFe+3zZfrCeh4VSM+1Ce6x93zq/LLDt5tEDHkXbJqxLxNCMN8Y4k7E9RBeW
         xRSC+rEypDXhIMeWFOMRYkG7J2y3KzJvuGVL4bXyHAS2DtsbOrM0Cp/1idxN/UtuPWWL
         mYoAOFVKqip9Tqe44wV1xD72gxW727ef7uyOj3NyfLVM4WNIv5bzbzPHVOgrf+bubQU6
         b6Bo9YHBNZ2oTnYsi5zrBpumhP9TFhY9qFwlAaNdeUdMILuN8Z5tW1K/E5bWv9NxSHf/
         TKnt1qYq8xzC5QObnjYQiWZYfyg+mpU2DKTEu2rYiHzKnk63fLSRMUvdVImibNLRhCM7
         IU0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733226912; x=1733831712;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=on3sYEGd2/W0CVrqLqHMmcTuEZdP/rp7cfagL/Up9EA=;
        b=o12bkHPb5kF+pHb0EBKFUJ5QZEoCewGLAaTNqtjkLGT52F/HV5ogLxiQLAno12BVbD
         DenLTmVMxw8Jhs5zhuTlSmjIpFr7oP2wYVtjcKTmKjqnAmsifVkG/zcFNsKuwOlvo2Rh
         dw/3c/o03QOEQEX/a2IBipZFh0GT/YezQdjFMQ4UnFDNFvzNNlHVTxBcOyxzVDYDvM6C
         mxhTwu1IMk/UtRAIdM3epWV2/c1KC22VNXeUxpfAUuiT5Asg0OE9W5L3NNLxHa6ZZCef
         Ckfh8aHwOh9K5A27ofKoTgpVxjkdC5/0z2metHqQpk2xU/MLW5gPGjP3hExA+/0AX5rA
         erLw==
X-Forwarded-Encrypted: i=1; AJvYcCU8LBSUr4oU54JfVjL6lSudVrj30wkDrSyC3ETBpa3iW8FgLTD68/CGEBaPAxm7jt5vLDA6+A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzHrWNVi7jHQ1DeYWcGs5x+7H0EumsYsrqVMYJcW3X65Rrlc9TE
	n0fygMIKSnLMfS5VeW5O6dFSb4FBqS4zbFrYMz+74Nf0RjrGQH//k3SUGIF+UTI=
X-Gm-Gg: ASbGncth1vnqTdTwNPR2liQ8BTa3YocGTt0U3+CdYoj+deADacMf3Fv27RAeRDm5KY5
	ISLpx0DFWjkrxcSTNTxPJikWACaJOHfS2p4qsaauy6NdBHFk2GsHH0vDQqu/7H1fUZ5G3ZGRmZt
	cVtyNMQMut5vsWRVHzU4dAkIqkuaw8ur1n2yrSIl0AsVWCY9099+c8cVYkIfWoXEPKGGncXvh77
	JzRQGrpWa85e+WB9AP6Bv/yvigzKBlR06ngBwdXiFeVk+Db4rDh6A==
X-Google-Smtp-Source: AGHT+IEOoaKE+Jx2lB/U0/CuOwfrHNpbiVubl22ruotoapXCu3d/MzBK3IqvDfPWg35JXHbV7cl2rQ==
X-Received: by 2002:a05:6000:1ac7:b0:385:f44a:a64 with SMTP id ffacd0b85a97d-385fd3d0816mr1896449f8f.24.1733226912618;
        Tue, 03 Dec 2024 03:55:12 -0800 (PST)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd36557sm15172989f8f.24.2024.12.03.03.55.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 03:55:12 -0800 (PST)
Message-ID: <ba893003-afda-4615-bf96-79b62bee51a0@suse.com>
Date: Tue, 3 Dec 2024 12:55:11 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 12/18] gendwarfksyms: Add symbol versioning
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>,
 Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>,
 Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>,
 Miroslav Benes <mbenes@suse.cz>, Asahi Linux <asahi@lists.linux.dev>,
 Sedat Dilek <sedat.dilek@gmail.com>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20241121204220.2378181-20-samitolvanen@google.com>
 <20241121204220.2378181-32-samitolvanen@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20241121204220.2378181-32-samitolvanen@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/21/24 21:42, Sami Tolvanen wrote:
> Calculate symbol versions from the fully expanded type strings in
> type_map, and output the versions in a genksyms-compatible format.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- 
Thanks,
Petr
