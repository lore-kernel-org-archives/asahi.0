Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B35919307D
	for <asahi@lists.linux.dev>; Tue, 12 Nov 2024 10:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731405644; cv=none; b=EIhidWpiSm9rk772e+NhrdK0VBjiVBjdhj+KszZ7hSQGpJz80b5FGC+BhbYPcMDobQq1Do7m8yyOWFh8ZuuCNQyYihnGqJGSa8G95TXRlUwxLKSgQOERnqHKN8dyQjfGimHsfp0oOm0SnkPgK2H1j6tKAgqvfoUu1Sz8uY7omro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731405644; c=relaxed/simple;
	bh=PZpWwIaqpEkf0GddjPCXdhQFVh+zdBbtaLAf1Q8J9LE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=drzbnfCxg0Zc1TohPesuyHRRzPM1h7jwt5kz2WxRLcuSfLvOCwIJf4EvRiKGpd7Qv5vC5NMGucL5NuPsrVU1Y6kSZUvMuh2o+T4/K0PIKIwqEbJD0KW6o+vlb9mrwfQ1ysa02VeaaiE4cfr2YThW44Wq0lNudqph7hT9dL9MuX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WQRhNUdY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WQRhNUdY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731405632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=/g7kvUmEiFxKI9h6mQjPf5Uq7FOJ+DtGygEwGMCj0Pc=;
	b=WQRhNUdY+4Ni38QYyREPqXbmBRvkaytVXsB+UZ5/oclIq+Z8MTi6P/tLuVy2mEcgIPzWcm
	XiosG6XUZR2EE2psxFiL1oaWr6sihxqrZ+YE95gvcvfKwkzstl1TsTB6mebnHDmVBcZKKy
	Lfc7a2CTs3gWfIJjPDNREjCaakXtNZk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-218-CakAB-jcPhWgbut9a1BXKQ-1; Tue, 12 Nov 2024 05:00:31 -0500
X-MC-Unique: CakAB-jcPhWgbut9a1BXKQ-1
X-Mimecast-MFC-AGG-ID: CakAB-jcPhWgbut9a1BXKQ
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-431518e6d8fso39525905e9.0
        for <asahi@lists.linux.dev>; Tue, 12 Nov 2024 02:00:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731405630; x=1732010430;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/g7kvUmEiFxKI9h6mQjPf5Uq7FOJ+DtGygEwGMCj0Pc=;
        b=A0gLyoERWr49EfbGKmGPCweAhHWLfNSGHSpLdWVppqSvIG0V2eLjnkgJdaNFO4PiK5
         /TF0tJMvobTzQT9ZPBU87LCzEWeQcD10itgOyG0aYb+TXsBJ4Oow3B25hXOx85Ri92vu
         bpqvItboEZ/EVJSwTTfCgg8m3tlbzckqt9s/E4Ew8WmO21cB4dJGJkniXRbvujCHhEoK
         VGgB0IB5fxAuhSlafDIgoDlgNU2kIw7tasRoLmp7LG6cdeArhWiVGxs3MUuOqo6sZ/YT
         DbxmWHrw0u7gG1GsUyhgGDn2UJ6hnuAOc8rMBlYjdL045hYBUfHD3HikwL8E+XA9gNs4
         kMaw==
X-Forwarded-Encrypted: i=1; AJvYcCX7SZ9wlLbVddVU0xfoU4sr+GsXK2lKAyDhn6Jkn9f84k6mPSs7GrJRhopKbaku+wMu9YsbBA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0R/m4mTDQckj3D5xAjfL/Gm76G8vqdM1fG/j2Uy7zl4xypvdL
	VKL6phcMZwbmyCX6lFd+ypxpFuWSvGlZZMEsi7JX8u4lE5E4Gy6CWtU7SJP0MYBHALtPMl2sGdx
	/jDCudeebqGnCdOiGMiiuODLqgWL+tfKR0/91NhpU4OuzO1WVeQix
X-Received: by 2002:a05:600c:4587:b0:431:52a3:d9ea with SMTP id 5b1f17b1804b1-432b74a0c04mr143719895e9.0.1731405629745;
        Tue, 12 Nov 2024 02:00:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEqTqPH/uell8dxfDHzR5SZujlJDZ25L/v3M3oMrYgW7GP8h3EzFcDSVtowC6DEhh3Ic5I10Q==
X-Received: by 2002:a05:600c:4587:b0:431:52a3:d9ea with SMTP id 5b1f17b1804b1-432b74a0c04mr143719395e9.0.1731405629258;
        Tue, 12 Nov 2024 02:00:29 -0800 (PST)
Received: from ?IPV6:2003:cb:c739:8e00:7a46:1b8c:8b13:d3d? (p200300cbc7398e007a461b8c8b130d3d.dip0.t-ipconnect.de. [2003:cb:c739:8e00:7a46:1b8c:8b13:d3d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381eda0411csm14784067f8f.95.2024.11.12.02.00.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Nov 2024 02:00:28 -0800 (PST)
Message-ID: <50578e9d-6562-4f0f-af7c-cabfb875bbb7@redhat.com>
Date: Tue, 12 Nov 2024 11:00:27 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: Fix __wp_page_copy_user fallback path for remote mm
To: Asahi Lina <lina@asahilina.net>, Alistair Popple <apopple@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Sergio Lopez Pascual <slp@redhat.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 Dan Williams <dan.j.williams@intel.com>
References: <20241101-mm-remote-pfn-v1-1-080b609270b7@asahilina.net>
 <c00226ea-6e29-4432-a1c4-a25e9e05df9c@redhat.com>
 <2d8380b9-3d03-4263-b5bf-7e0227c83ba9@asahilina.net>
 <0977a33b-8318-43a5-a5a1-4eb8c93ca270@redhat.com>
 <64d386e8-6684-4213-8aba-7d1daf94f2cf@asahilina.net>
 <412298ff-80bc-4111-8c72-29a5263a5d32@redhat.com>
 <87ttceu0i8.fsf@nvdebian.thelocal>
 <821d15f9-233e-4b9d-8194-5de1835113c7@asahilina.net>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <821d15f9-233e-4b9d-8194-5de1835113c7@asahilina.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jxwPebFxl0B7wy3G3MwJDMBtULsJBq4epaWT-w2UuIk_1731405630
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12.11.24 10:48, Asahi Lina wrote:
> 
> 
> On 11/11/24 8:24 AM, Alistair Popple wrote:
>>
>> David Hildenbrand <david@redhat.com> writes:
>>
>>> On 07.11.24 18:32, Asahi Lina wrote:
>>>> On 11/8/24 2:14 AM, David Hildenbrand wrote:
>>>>> I recall that there is still a problem with false-positives on
>>>>> folio_test_anon() with ZONE_DEVICE pages, so it's maybe not that
>>>>> easy ... and the whole get_dev_pagemap() stuff is nasty.
>>
>> Specifically FS DAX reuses PAGE_MAPPING_ANON in
>> include/linux/page-flags.h
>>
>>      /*
>>       * Different with flags above, this flag is used only for fsdax mode.  It
>>       * indicates that this page->mapping is now under reflink case.
>>       */
>>      #define PAGE_MAPPING_DAX_SHARED	((void *)0x1)
>>
>> FS DAX pages are never anon though, so you could probably test for
>> !vma_is_dax() and/or add an implementation of is_fsdax_page().
>>
>>>>> Likely we would have to do what GUP does, and temporarily grab a pgmap
>>>>> reference. Gah.
>>>>>
>>>>>
>>>>> So if we sort out the pagemap stuff and the possibly wrong
>>>>> folio_test_anon() on some ZONE_DEVICE pages (but not all, because IIRC
>>>>> DEVICE_PRIVATE can be anon ...), it might be doable.
>>
>> Correct, DEVICE_PRIVATE and DEVICE_COHERENT pages are always anon (at
>> least for now).
>>
>>>>> But it sounds ugly, especially because that code might change soon and
>>>>> not require messing with ZONE_DEVICE pages on that level.
>>
>> Yes, I'm hopoing to get the next version of that series posted this
>> week. I found a couple of other FS DAX bugs that slowed me down.
>>
>>   - Alistair
>>
>>>>> And then, we'd not be able to handle VM_PFNMAP cleanly ...
>>>>>
> 
> If this is all going to be fixed another way soon then I think there's
> no rush to get a workaround in earlier than that, I just don't want it
> to fall by the wayside.
> 
> We have my original patch downstream in libkrunfw (which despite the
> lockdep complaints does work in practice)

I assume it's sufficient to deadlock when a writer pops up after you 
succeeded with the first read-locking, and before you start the second 
read-locking. IIRC, rwsem is a fair lock, so read-locking when 
already-read-locked is not guaranteed to work.

That's why lockdep complains.

-- 
Cheers,

David / dhildenb

