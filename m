Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410161C9B82
	for <asahi@lists.linux.dev>; Tue,  1 Oct 2024 14:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727791906; cv=none; b=pH1h1U4KeA9usFLHV2xpW+tkufdhW1lfV+m2eoejCMtxRksHYfsFGUE+KtrNyYo7YoCyGhnGGCT/kuhp3snMOAm3lsGEFMUufkiCxHBPC2b1HNxqYibUeV0qDeLpH2+AsPlH78fU+qVma3Da38pizM+cuJs+r2umveco09H97oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727791906; c=relaxed/simple;
	bh=VdlVC8iJpt4iKblG4aq8arzEwH4jK+WQJcBtAtuQ4nM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QkUO7jnwKuv9pD0HbgNPBuKpA1+KvbJbD1fToxIXmffKqjYAxG4mZR02Vga8pKQBC5QltxIxLbDTtlBGOCMsX20se+CMzlKMfji2awpyqpSbvmBBbUbwrWWXyjRyKbuXMwaglgPYdGxfqP4CQJhekAvN/ZxRzyPyxVLFZMEjToo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=GldayKVd; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="GldayKVd"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a8d43657255so57561766b.0
        for <asahi@lists.linux.dev>; Tue, 01 Oct 2024 07:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727791901; x=1728396701; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wOjUVaBpjp8ksO44qoSMn8G1zrkoXgW5qFaOpNFpNPw=;
        b=GldayKVdRHBSpA0KfSZQjXveclB0p2GrOg+aw00zj1SUGSQfJckK+KPnNJT8dmdoWJ
         kL4InkMd2+a+GUgX+31p9bKmKqW9OFu8DE00PhRJZCtYZdlzjIqAJU28nduPmUJ25f3C
         ScPXj1uGvv45Jbks/fBD8YdTcPSp8c6jd70UEVh7B9TdiqEKyJI7YcXUIHAi0Fgq+91y
         ZxPFPEywaA4++gFrkJa6gCvhJ8UPVQOCb0xwVorfqRVGYbIUhew5eQSTgw79F8GwQSYF
         8kIs3F7uPmgBROcEAEf3VOxCmOPo0tUT88CrNrn9GiL18XRHYRWbELhuYXKoTyJcIXW6
         dk7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727791901; x=1728396701;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wOjUVaBpjp8ksO44qoSMn8G1zrkoXgW5qFaOpNFpNPw=;
        b=g2wWJgHpm9c7EGbSGcDu1meCAeJogB4C+AVqnXu7uSR5lLb1Va4X3YeWkR4GYCZgYh
         srHSDQyA+hxjx3XxZYZb508NHB2Uxe9dNAyuTsxUHITB2yGBaXMMl7w98RZaBdy78oXa
         NPgMWEXmRlHiCD10GrMqGvFrwBNCyzcwpZ4dHXky0Zk26WMPZfo26VLbRvY/7VSfYH0Q
         ZE6WbVdruUPRR8ruHwbh9XbuVb73CClyUmYXL30xr38wHha9lxSzQoBwU/0/U946oqJd
         3e1xrK5mUakYapPpBOk5EKubuxONArJPvSiYzhfbEXs9GCASQPFNWnGIS6OY53ge68Xb
         i8rg==
X-Forwarded-Encrypted: i=1; AJvYcCVk0wvPOLFDLJrEcIdb9MTntjpIscVmM4znWbTC+hnY4cKNFZsACU4IMw+n9+/5fL+kBxp13Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx45DOUQXI6WwLL/1fS0Ux1VjJzrX6wPY5TSP0QW0u+lvqmcJwD
	qvA2WtfcIS0vgllrsdOjIbl1IvboeNen6xQfB9V900RS2yZn5Q3cU3vhw+TLC+g=
X-Google-Smtp-Source: AGHT+IFZe2WXQ1gN6enIFV3oFO5bE5V7+nXKC3Q4fwOM7pCdPvYuTE0iA4osOJNRHsOSK/gRq1zsrg==
X-Received: by 2002:a17:907:1c17:b0:a86:95ff:f3a0 with SMTP id a640c23a62f3a-a93c48e8ecamr1799486366b.3.1727791901559;
        Tue, 01 Oct 2024 07:11:41 -0700 (PDT)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c297bb8fsm729191766b.176.2024.10.01.07.11.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2024 07:11:40 -0700 (PDT)
Message-ID: <64221b94-b081-436d-9ad1-ceaa70a6a960@suse.com>
Date: Tue, 1 Oct 2024 16:11:39 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/20] gendwarfksyms: Expand type modifiers and
 typedefs
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>,
 Petr Pavlu <petr.pavlu@suse.com>, Neal Gompa <neal@gompa.dev>,
 Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>,
 Miroslav Benes <mbenes@suse.cz>, Asahi Linux <asahi@lists.linux.dev>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20240923181846.549877-22-samitolvanen@google.com>
 <20240923181846.549877-29-samitolvanen@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20240923181846.549877-29-samitolvanen@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/23/24 20:18, Sami Tolvanen wrote:
> Add support for expanding DWARF type modifiers, such as pointers,
> const values etc., and typedefs. These types all have DW_AT_type
> attribute pointing to the underlying type, and thus produce similar
> output.
> 
> Also add linebreaks and indentation to debugging output to make it
> more readable.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> [...]

Looks ok to me, feel free to add:
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- 
Thanks,
Petr
