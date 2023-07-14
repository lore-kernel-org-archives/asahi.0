Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322A820E8
	for <asahi@lists.linux.dev>; Fri, 14 Jul 2023 13:58:26 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3a3e1152c23so1522391b6e.2
        for <asahi@lists.linux.dev>; Fri, 14 Jul 2023 06:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689343106; x=1691935106;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZfFtZs44m8Zo9MX+jI8UvKsAHjyMfdzKjYmKjQfTOeg=;
        b=SOMD47bUKBvnNMJxuo/Qqj7JmiLOY4XuCjCV7OA4NqC9jEPK/YBH9lguUT0Oj6V+Y0
         RLvhlP/QahZguVu7MiQ2n+nFhiiCGdnWJptntNF1dcLU7d9X8A1DMVpM6AXP2ACkPWf4
         /UG6tXSI3U9YII4hNk2in+CHaHdUU0RDiiCFcDsGcIwVk0tYEgNHxVgaGb9Kfpc0P0mi
         wxSHf6BeQFqLqAIZlaxFHD3dCqpXzWQ+eR9FH0R9tFo/LRDJpNRJyXdHwhkykqOzgqJN
         GYrrH0PfSIhTBxSc7OAig1DcEFl9ROCApXCSxK9z8km57x9l74Y/zBrP5oqdtZjyFc+1
         QsAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689343106; x=1691935106;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZfFtZs44m8Zo9MX+jI8UvKsAHjyMfdzKjYmKjQfTOeg=;
        b=gY33I6bdVSJ+4uVvWezhz6CDJFaSY865hStzBYDpvwdcs7IRxw1Z6qcEphxETp0I/W
         ouOs/SFd33Zz37OvgDwG1IaBmjyJH1lA3lc33e0Gc4QieA5oOyFBWgoAWr++g84ZsnxK
         WwHOBPUdXisCWly9UqsqtGATxEYdh3JNTTEb8ZUFGQcJoXiOho4pY0iyIoljzA/UJ9zc
         mtVBmH/85MQGPIpEHrgAuzGIE0Xg3+XWiJfZ+j8+eH/MWCtYfRWsexWmUE8e7jclaIjB
         CWzBivDFvVCHSRKQK919sKrG061IbLZVRUCD6MTPZ96WP+bz8R/sXwQOd2PAbOBMGH00
         ceJA==
X-Gm-Message-State: ABy/qLbiz41y/iEHjBf+uVPDvxiMwUe+bENDIG6IZM4X1K9HMDqkhbB9
	rUP9ygpE4M917h1mDuaWgsh9dq6sYII=
X-Google-Smtp-Source: APBJJlHP70TqG1swKvKXkahgek85etZ9fjwVf9HrNOpgCunvCDPnEnX1u4cZGMd0PKCFkhRHSHUn5g==
X-Received: by 2002:a05:6808:f11:b0:3a4:31da:34c5 with SMTP id m17-20020a0568080f1100b003a431da34c5mr6280192oiw.39.1689343105983;
        Fri, 14 Jul 2023 06:58:25 -0700 (PDT)
Received: from [192.168.54.90] (static.220.238.itcsa.net. [190.15.220.238])
        by smtp.gmail.com with ESMTPSA id dz25-20020a056808439900b003a3600182f8sm3883960oib.57.2023.07.14.06.58.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jul 2023 06:58:25 -0700 (PDT)
Message-ID: <213cc5ce-9d4a-eb51-7259-50dfae4665f0@gmail.com>
Date: Fri, 14 Jul 2023 10:58:21 -0300
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] rust: time: New module for timekeeping functions
Content-Language: en-US
To: Asahi Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=c3=b6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 John Stultz <jstultz@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Stephen Boyd <sboyd@kernel.org>, Josh Stone <jistone@redhat.com>,
 Gaelan Steele <gbs@canishe.com>,
 Heghedus Razvan <heghedus.razvan@protonmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 asahi@lists.linux.dev
References: <20230714-rust-time-v2-1-f5aed84218c4@asahilina.net>
From: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
In-Reply-To: <20230714-rust-time-v2-1-f5aed84218c4@asahilina.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/14/23 04:55, Asahi Lina wrote:
> This module is intended to contain functions related to kernel
> timekeeping and time.
> 
> Initially, this implements an abstraction for a time Instant (analogous
> to the Rust std::time::Instant) that represents an opaque instant in
> time. Unlike the std Instant, this is a generic type that is bound to a
> specific clock source, so that only Instants from the same clock source
> can be subtracted/compared.
> 
> Then we implement the relevant clocks available to the kernel:
> KernelTime (CLOCK_MONOTONIC), BootTime (CLOCK_BOOTTIME),
> RealTime (CLOCK_REALTIME), and TaiTime.
> 
> Co-developed-by: Heghedus Razvan <heghedus.razvan@protonmail.com>
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> ---
> [...]

Reviewed-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
