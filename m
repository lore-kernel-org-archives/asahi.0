Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DFB6FAB
	for <asahi@lists.linux.dev>; Tue, 21 Feb 2023 17:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676999608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1yPp4giTefdhMbNYiavZiH2cm1Lod+7F0kuDYxzrSTg=;
	b=NeijGzuJtNC0ZIV9fuMs2qvqXyXPKpFQKRZGoULNNJ0BaQsHYuBSkMF0jysNRshCFKixPX
	WgVRq5n4+REYFJW9EW3/emAjtA5PUBiMEDZzsN6N1J/cx6Sb570YY0405nqwPU3MYpXR/L
	n05Jn5ZpU6U1kyXznAuOw5rFsFYkhQQ=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-403-oajR1y3eOH6ri_bYdcY-zQ-1; Tue, 21 Feb 2023 12:13:27 -0500
X-MC-Unique: oajR1y3eOH6ri_bYdcY-zQ-1
Received: by mail-pg1-f198.google.com with SMTP id n66-20020a634045000000b004e8c27fa528so1769420pga.17
        for <asahi@lists.linux.dev>; Tue, 21 Feb 2023 09:13:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1yPp4giTefdhMbNYiavZiH2cm1Lod+7F0kuDYxzrSTg=;
        b=2Kdzb4llega0An6C4x1zORwTeMDJi+bZ/YGGwpM/1wTfDWEFlnkUeXFonMfzN+uv7z
         phgqN6zyF7eFmtvaVHm50+/36nSytD8BN3gWTgxi5zRj3iFvqmZHbFOhumvepJdo7Snt
         7o3/GGADpYHznoDXMnyM5IC/fixfNKTnguhKi0Y+8XZ1/bFRpOE/aYcU+7WM4D/GLiHz
         89ULT6PkzIhVeUBrLXsE/CYldq9y3hE9/x9gUj8uMA+JOo7wfzFkWhyW3FakxVYph+37
         MTWefciIAwYt6Mq4JdpHGI4duBWZmTUjTf5wvJ5eEIQqSDGbLFGwHt7Bb4+jxpuxsIB1
         HLsg==
X-Gm-Message-State: AO0yUKVBIkQo7Is5o6tsYL6J85S/kjbie/KUF5QkeY4FLFo0OgmEsW3w
	TdXZtpHcJD6CRMMMsJzMx5j1lkF+sBh41dmJMAWLyiUlEWXW8sUbwSO90D75gzr6HVemctxvmHi
	VxDbVkYTVGD3TsBc=
X-Received: by 2002:a17:902:8b85:b0:19a:b74a:7f7e with SMTP id ay5-20020a1709028b8500b0019ab74a7f7emr5874054plb.28.1676999606336;
        Tue, 21 Feb 2023 09:13:26 -0800 (PST)
X-Google-Smtp-Source: AK7set+RtL9IAIPXYJCcn8MrIbfJVmPzlVV8mepNgQVRI7RPXIX1+E4Kx9H9UE8S/26bkU9BkRgtWw==
X-Received: by 2002:a17:902:8b85:b0:19a:b74a:7f7e with SMTP id ay5-20020a1709028b8500b0019ab74a7f7emr5874025plb.28.1676999606000;
        Tue, 21 Feb 2023 09:13:26 -0800 (PST)
Received: from ?IPV6:2601:1c0:4680:5870:8add:adee:83ef:b4f3? ([2601:1c0:4680:5870:8add:adee:83ef:b4f3])
        by smtp.gmail.com with ESMTPSA id v10-20020a1709029a0a00b0019abb539cddsm10112124plp.10.2023.02.21.09.13.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Feb 2023 09:13:25 -0800 (PST)
Message-ID: <65ab5cb1-2dbe-e853-48ea-d1df87706cf0@redhat.com>
Date: Tue, 21 Feb 2023 09:13:24 -0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] rust: time: New module for timekeeping functions
To: Thomas Gleixner <tglx@linutronix.de>, Asahi Lina <lina@asahilina.net>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=c3=b6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 asahi@lists.linux.dev
References: <20230221-gpu-up-time-v1-1-bf8fe74b7f55@asahilina.net>
 <87v8jvnqq4.ffs@tglx>
From: Josh Stone <jistone@redhat.com>
In-Reply-To: <87v8jvnqq4.ffs@tglx>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/21/23 4:32 AM, Thomas Gleixner wrote:
> Now the problem is that 'Instant' in it's specification is bound to
> CLOCK_MONOTONIC and there is no way to express CLOCK_BOOTTIME, but
> that's a shortcoming of the spec which ignores CLOCK_BOOTTIME
> completely. IOW, that's also a problem for user space.

That's not exactly *specified* -- it's meant to be opaque time. It is
documented that this currently uses clock_gettime monotonic on unix
targets, but "Disclaimer: These system calls might change over time."
CLOCK_MONOTONIC isn't even consistent across unix targets whether that
counts suspended time. It's been debated if we should switch to
CLOCK_BOOTTIME on Linux, but for now we're sticking to monotonic:

https://github.com/rust-lang/rust/pull/88714

But as others mentioned, this is in the std crate which isn't used by
the kernel. You could absolutely define your own with more specificity,
like kernel::time::BootTime, and copy an API similar to Instant's.

