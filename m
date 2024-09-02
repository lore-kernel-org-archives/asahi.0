Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FA01C32F2
	for <asahi@lists.linux.dev>; Mon,  2 Sep 2024 09:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725271036; cv=none; b=LUUVsBN0ARPQA7BjxdhcfQkztq3Rqz9mW0EeseGKct8RrzxwlFpVb+BwAqpCGLpqGodwUF6/wV6pE9RSDNY7b+V5shcnl02MSEWi5qcnLdu+FOCCXyzJWExzZUntsT/Q/QhEkiRhnvjFWo6q6dRCiBI/xNmfyW7WooBltVGylH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725271036; c=relaxed/simple;
	bh=azrlqXQHeE9U6sT5l2klpYX/5FeFDtmF4VwChR6aHvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BTqNKQxHt9cs7GFN7+3HS7Ex7ASXNgDv1eGjNKUnf1Z4OQCbqGdZqKhgMG9XvvfS6vOw7ijewsxgQxjMM6JNw23z1kqSWwt9bKlfLkdXeAsZp12e8y7cI3syNRL4SujeQP23KRIdVrp9NMKEoZ1h8iGK+QtkBQoBOUp0QWIuRP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=hEmG1qVr; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="hEmG1qVr"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2f3f163e379so64132121fa.3
        for <asahi@lists.linux.dev>; Mon, 02 Sep 2024 02:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725271033; x=1725875833; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yjsZv7veQRgQQOgF16n7lr/LWeiZhMmKVsEed9iOcZQ=;
        b=hEmG1qVrMnCntUEaG6JZ5NhcNuYRbfisH3p+S8Dd+BKOc2wWOAEcBiNXG/Iyv6QBtP
         BO1h5u2zIbsEW863iaCCcfxWN7gW7nKAa8xUyOMu/mWBOPZponhHqMIU5Nb3xeC/i7GC
         rqTawPTUaTj9scpyijEuei4V6Z9Swrw2vjU5duxQjN5doK7OSVTFXHf83H4ftQylgIzR
         xMxUaH7S4rGe9VLeQQoDtKX/FhRsvK8Yb6HFLEfNcskRxCjJDMjt7wFl2zJvWKYpOuph
         86qjyyq6M8HDN85015OTopVsrbC6mgkBHrup7bxoqXUgj+urZ5c9//649oa3YIGKzoRN
         +CnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725271033; x=1725875833;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yjsZv7veQRgQQOgF16n7lr/LWeiZhMmKVsEed9iOcZQ=;
        b=NTppnPWCwM3VMvMOfLTuzjd/fWerT7VkyDxmkk0zvPPJTJLmACPOCXGq07rz76nG3M
         0VLYmSSzJP8LGuKNAOc7mXwm7qQqr3Gwpxk81HfkcAWuyzDaAD1XmC9wznwmUj9LPm2R
         8mDOkYsexOvvsUbl1ZIUXbSE23PcCNQ2zbmDhWPgvwsV3SFIafH0b5qUehU9ZNdahGdE
         0j9uIYgRhJUVKgLBaJlFlN0SlOKR2egmwHDPE5VkO+ZSD95iqNsOTQ7ig3AzV2dkFCoB
         M+DcayJOYFKPnKwC/+BGuW8jNT0yCjfrLebztTV9QZNcFIBDTWLQJN7F5w4l3djWpBQM
         r/bw==
X-Forwarded-Encrypted: i=1; AJvYcCXBmFo3RRo5FEbzVgn0xI8KiDPTOqxlfcityt3GH6oQwxwHSqMKRYPH4WEK24O4HoVabVlbZw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzHq0z6Jtk+7TuXpKnRF4IdLcBGTv0Jvh5oZ2SYY1+lCswZcFAw
	Q/dKy8oK3FwYXBmGShsT1HvyYfBHb8I+wCa7TmZD1isPD8PqMKrE/3SCtJZo6pI=
X-Google-Smtp-Source: AGHT+IH7z8FryQZ6mKwNMkGnRP2RrSvLwrgspXmgco9jQNTg8+KhqeedDLVTW9djucaR8HYMG7P+gw==
X-Received: by 2002:a05:651c:19a3:b0:2ef:c8a1:ff4 with SMTP id 38308e7fff4ca-2f6105c49a9mr116896891fa.7.1725271032683;
        Mon, 02 Sep 2024 02:57:12 -0700 (PDT)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c226c7bf90sm5031726a12.43.2024.09.02.02.57.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 02:57:12 -0700 (PDT)
Message-ID: <20420395-28ed-4579-84e1-4f7e7641363e@suse.com>
Date: Mon, 2 Sep 2024 11:57:11 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/19] Implement DWARF modversions
To: Sami Tolvanen <samitolvanen@google.com>,
 Masahiro Yamada <masahiroy@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>,
 Petr Pavlu <petr.pavlu@suse.com>, Neal Gompa <neal@gompa.dev>,
 Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>,
 Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <CAK7LNAQ0dHq3eALkvGDSCyVKOvhBqwCEG3BTQ0h52Xq_1YNu2A@mail.gmail.com>
 <20240828225302.GH2130480@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20240828225302.GH2130480@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/29/24 00:53, Sami Tolvanen wrote:
> On Wed, Aug 28, 2024 at 04:04:09PM +0900, Masahiro Yamada wrote:
>> On Fri, Aug 16, 2024 at 2:39 AM Sami Tolvanen <samitolvanen@google.com> wrote:
>>> - Added a --symtypes flag for generating a genksyms-style
>>>   symtypes output based on Petr's feedback, and refactored
>>>   symbol version calculations to be based on symtypes instead
>>>   of raw --dump-dies output.
>>
>>
>>
>> I do not know if this is worthwhile.
> 
> Greg, Petr, do you want to comment on the usefulness of the symtypes
> output? I was under the impression it was a useful tool for figuring
> out exactly what caused the versions to change?

Right, the symtypes data is useful if distributions wish to maintain
stable kABI for their kernels. The data can be compressed/consolidated
and stored together with the source code for the distribution kernel,
serving as a reference kABI. Later, when the kernel is updated and CRCs
of some symbols change, the reference can be compared with the new
symtypes data to understand what has actually changed.

The previous discussion was under v1 of the series:
https://lore.kernel.org/linux-modules/0b2697fd-7ab4-469f-83a6-ec9ebc701ba0@suse.com/t/#u

-- 
Cheers,
Petr
