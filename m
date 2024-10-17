Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C33A1DE3DA
	for <asahi@lists.linux.dev>; Thu, 17 Oct 2024 14:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729174209; cv=none; b=a/6Rn57q7TIBXHbVWJL2G+cFpyjumDXwg56AI2fua5DTszuk1lkbtQuTU0msBnzoA3nuh4v1tNbs2cG2yHR+aOc3hlIoSLYGYpiP05Vu91VeTfvw3oNeg7W2Caqn6pu5Ww7gcYdF+0jipvS584En9MBPYvPRjdV+pxvNM41FWCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729174209; c=relaxed/simple;
	bh=ImKjS1mAlM/QGNcooKsvSkdmdgnP6JCFSjvMcq5jt2g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kk6KkqKi05QOLIIP7Q/qOYRoVXlRMZ4X2Gwim44MSFutW5+J+OzkDa7P7Noqv3NmMwxB02Ki2ZYnLc7jN8YjmUWqbbUdRE3XMf2pRMtD3IxOFGjDiwEIXp1CGiU71yv7R+hi+l/N+TVRcVqBTMCaG5xW5WmDLoN4Qs0JzWgv4hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=FSjTbWn9; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="FSjTbWn9"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-539d9fffea1so1061329e87.2
        for <asahi@lists.linux.dev>; Thu, 17 Oct 2024 07:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1729174201; x=1729779001; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ffWX4sOiGU0Gsj52d9Xu9O70WErhSlef0BU/L7bSCGY=;
        b=FSjTbWn9+fF6VY5svm4ymmjWZcf3CFk1jBdTdDy/jimaa48sNl69FljM+6ph2z1V/r
         vPHoWfS0DXTduFoRVDVHhJUoCauRQWm7TajRH6TWwgjiwEdBEVY/aVOnZ2/FBhZrhxbT
         PiGF/3lFSilBH94x158apjvLsxP2s8VhoFJV9xVJUIhRRhwYn41lg9ZZ7O24D0cbLk8B
         PQjzjl9roQIS2mD7pagr9Rq2vQVXkuPkaBUnzfpW8o4e4f4DURHk6a0wVYBT9XerixOR
         olQzsVhwB/Rs2/ScNRUNUUJWvoEzaSB0T4TjLUU+xG7wQ0WEd5VgTMxgvCUvna7MOu16
         H52w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729174201; x=1729779001;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ffWX4sOiGU0Gsj52d9Xu9O70WErhSlef0BU/L7bSCGY=;
        b=bQuFkd1MALKUOwdSGA8q7B2Hepw9ADurIzNGZlfpVRsdBlYPe51lDrwRK+mBB3mzFN
         zTHQ5+Z6nWrLiwsxvdPZXslhf9FcwyFBhg1ldr7AOrHZfozOY1qKkZcdEKZutIvHxPDA
         qnpi5TcoxrFTIbK/xX4RC+8/uIEDVgvNhzX/XfTNBYMFe6Bcwp24lO5a/h7RG94A10Xd
         SbKEj8SouLC74vFEswPrLp/G90fCA6NbLjTEUR114QLZIl5Ay/YGA+tvTERdIQZVmWrT
         wfFLrG0kcxCPBaX5A2ix+5PVkEMPBTgxuFM8oe5qy83BFmmh61HnGm+LutI52pZLV+cx
         uWmQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2zuD+Kcm+pGlkX49OfHbOHGvfoPvA2g2t6FlruoUfnTVWvaf1AcNxtinq6bn7ph+Q2mBawg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyqmDew5qTLi7SjkU6YoWa/NI8e4+inehXSpf13FmS/NcA/msu4
	kWCt9iAIiGkNv04tHkrehd1ttZ0buoUeLWXtZcvh+yPuozTYMuwmuSmOkNsVoJk=
X-Google-Smtp-Source: AGHT+IHtZ6iuGFS0h/96h+eqk0OJejp1EEqmyNTB75Id/1Au+oEGx2EvNsYPOJigxq2qwKknsnsYqA==
X-Received: by 2002:a05:6512:3b1e:b0:539:eb2f:a026 with SMTP id 2adb3069b0e04-53a03f36264mr5616478e87.33.1729174201351;
        Thu, 17 Oct 2024 07:10:01 -0700 (PDT)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a29895da9sm301265766b.214.2024.10.17.07.09.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Oct 2024 07:10:01 -0700 (PDT)
Message-ID: <cb0eb97c-bb47-4465-af4f-3b5dfcf41681@suse.com>
Date: Thu, 17 Oct 2024 16:09:59 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/19] gendwarfksyms: Add die_map debugging
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
References: <20241008183823.36676-21-samitolvanen@google.com>
 <20241008183823.36676-32-samitolvanen@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20241008183823.36676-32-samitolvanen@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/8/24 20:38, Sami Tolvanen wrote:
> Debugging the DWARF processing can be somewhat challenging, so add
> more detailed debugging output for die_map operations. Add the
> --dump-die-map flag, which adds color coded tags to the output for
> die_map changes.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> Acked-by: Neal Gompa <neal@gompa.dev>

Looks ok to me, feel free to use:

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- Petr
