Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF721C9DF1
	for <asahi@lists.linux.dev>; Tue,  1 Oct 2024 14:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727791966; cv=none; b=bfyAaCYBKhSNYRaWkvTqexOtw2TygI3cKRRjDQcoqXZAIAILbQFTkAZY+ksyZ4S47QNOtUVoLhs3GCU36WL7ZHig5Y6gxf1qUrt1bj8HPx2tlW/pxP8sHXovLlXiiFSb0usj7OI0cD1ZCjCVniflFtT2fNuBFdFfo2/gVwDo4h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727791966; c=relaxed/simple;
	bh=zANKrDNHHPw85OVvoKNOqJRMnnY/7KTHaVV++XWrNQg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YjnMV/pA00Vp9rMmaE2ghHbKJByc01qTydfVmAseS81yw5iyuikzDnIEYfvo/1heOHM+VokvFmRjIfZ8AiS5NxuqJWmwZIyZeoxw12p8XGXNhFsRjhh9BxBj/+w/nKdZ/Nvawva2dAdvOrIhg23ISxUG1rp5WtQHJI4DGw6fXNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=D1Pp37nJ; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="D1Pp37nJ"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a8d6d0fe021so968306266b.1
        for <asahi@lists.linux.dev>; Tue, 01 Oct 2024 07:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727791963; x=1728396763; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DeoJTd250N86AwxT75TCft/ULiYvSUL27Dnc1hyjfJ8=;
        b=D1Pp37nJVJXECw67d4Y0DiFnpaZjJ1enMjxwE1zmxDRXIIichD/fNlU9BCw0xO3Sfi
         1kWVXQ9fFJ9QTb2DwLDYOAktnS0qufCAwAjBFidgEGsHN7SRQUHBvaB+HBTVMcd8joFo
         nSPdxnzSxwKTFrQ1psqaRO6Gw66fMIzwJwLgX0yv4zHOoMNcYMPnTgwaoGull5tffNpG
         IE+65ljxrvoKPUqElVgW6H+8wN9od6GIdnrqhCiZu/1u71jTpgPsw0ZJ6kytEFNqJMwF
         Mo+l2KzuSsbuUGcbk2LACiZQMv7a/AduDG3YhlRzruT6HJV5dO+Itd9RlmOZZRMdKw1B
         /AGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727791963; x=1728396763;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DeoJTd250N86AwxT75TCft/ULiYvSUL27Dnc1hyjfJ8=;
        b=aOkGIHmWS8HpynkB2YwT5BdVkhV0sYdWYEsH3xF0UHN8QEds4XbgqnMMZc1sOJtKEp
         6C0gqmhfW+vaVS2dn7nlO44y2kxjt7McEbmpUUdezqk9lz8xOXbD3RCqrxTCRJ+qenLi
         sPsRC/8VRGM37eFlwoVdn2ne6c2vXopbG/5pS4GqKb7hKdPsvimU8/Glrbm5qUnzCRMV
         dgKWJzkJiYzwSAGWYRcDAz8W/M+8w2g8MA6Uaqsef4z+sfaLpVnUGrb6WmibQyAgpN6u
         1zCvwbAs8BR7RUsxkNCEfpQRhR/rA2m4f5nYSptFXXEmsNNaK6w0/eChm+QYML4gqw6j
         5JiA==
X-Forwarded-Encrypted: i=1; AJvYcCXaHa2WMgm/F16KTscwCtQZ9byegdtBD2q593XoA8iNNtBLbdAFBe8lLFENfvN7iw+oRoUbNw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzti6ZYvWRkliM6PsxqCwlUJbX4e1KWDKNWpyx03QxcYXlCo710
	40scHdT697U1kRr97sEqnAAEGQSYm/lWxat6OHShubaALBwcUfODhf8YGFQsZF0=
X-Google-Smtp-Source: AGHT+IFkBtWi40iUpXvMtDXyvuH4imak9CnOFIL9Jv+C/N0N1k9h3hOedmoIkMwXqfp0vxX1k3WfwA==
X-Received: by 2002:a17:907:d20:b0:a86:82e2:8c6d with SMTP id a640c23a62f3a-a93c4aefc0cmr1881927566b.62.1727791962932;
        Tue, 01 Oct 2024 07:12:42 -0700 (PDT)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27c5af5sm717179766b.70.2024.10.01.07.12.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2024 07:12:42 -0700 (PDT)
Message-ID: <105dd859-f018-4b24-96f0-f395d53db9b9@suse.com>
Date: Tue, 1 Oct 2024 16:12:41 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/20] gendwarfksyms: Expand subroutine_type
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
 <20240923181846.549877-30-samitolvanen@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20240923181846.549877-30-samitolvanen@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/23/24 20:18, Sami Tolvanen wrote:
> Add support for expanding DW_TAG_subroutine_type and the parameters
> in DW_TAG_formal_parameter. Use this to also expand subprograms.
> 
> Example output with --dump-dies:
> 
>   subprogram (
>     formal_parameter pointer_type {
>       const_type {
>         base_type char byte_size(1) encoding(6)
>       }
>     }
>   )
>   -> base_type unsigned long byte_size(8) encoding(7)
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> [...]

Looks ok to me, feel free to add:
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- 
Thanks,
Petr
