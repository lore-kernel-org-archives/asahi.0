Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5225E13700
	for <asahi@lists.linux.dev>; Fri, 14 Jul 2023 12:21:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: lina@asahilina.net)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 6D8535BC3A;
	Fri, 14 Jul 2023 12:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
	s=default; t=1689337277;
	bh=d4xdbM7mD74srDSAziRnx5VmguuxEc0Aefz9EyiBpKg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=z0Tg6hChx+665MPA0IvfNrMkvYn9RjQVZcSbfpBXdUr4QUBI0tLrIYxPIJlsp5olS
	 q3Xlx77MQrjLvv75QzlJmylZVXKZ/qus2XEkoI9K2jms7ldL60uDD0RorSeGpStrx4
	 iNBCY1EqVsxshjaBEwn/YLvZCSZZyxlUWgPeqav9eEdiKFeWp1o3DTycDVV/sIpMEa
	 adrNj5Bo6AOC9vmaCn3rhRXE+2Ms16oaHzWra+ATekIDLEGjuMQsjlFSUSnu9aeIz0
	 IIRmt22tLKX44ZQv8KUu14Rkl50YC5OQtscGmYosNYg35i3MH9tuZ26SFlB80DLJZr
	 rH3Ge0WAmq5pg==
Message-ID: <15a21f18-485d-37d8-0a5e-417702787204@asahilina.net>
Date: Fri, 14 Jul 2023 21:21:12 +0900
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] rust: kernel: str: Implement Debug for CString
Content-Language: en-US
To: Alice Ryhl <aliceryhl@google.com>
Cc: alex.gaynor@gmail.com, asahi@lists.linux.dev, benno.lossin@proton.me,
 bjorn3_gh@protonmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 linux-kernel@vger.kernel.org, ojeda@kernel.org,
 rust-for-linux@vger.kernel.org, wedsonaf@gmail.com
References: <20230714-cstring-debug-v1-1-4e7c3018dd4f@asahilina.net>
 <20230714094844.2189906-1-aliceryhl@google.com>
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <20230714094844.2189906-1-aliceryhl@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/07/2023 18.48, Alice Ryhl wrote:
> Asahi Lina <lina@asahilina.net> writes:
>> Trivial implementation.
>>
>> Signed-off-by: Asahi Lina <lina@asahilina.net>
> 
> The commit message is a bit short, but the change itself looks fine.
> 
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>

It's so trivial I just didn't know what else to write... suggestions 
welcome (for this or next time I have a patch like this) ^^

~~ Lina

